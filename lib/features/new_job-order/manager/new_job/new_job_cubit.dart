import 'package:bab_el_ezz/data/job_order.dart';
import 'package:bab_el_ezz/data/spare_invoice.dart';
import 'package:bab_el_ezz/data/technician.dart';
import 'package:bab_el_ezz/features/new_job-order/widgets/create_pdf.dart';
import 'package:bab_el_ezz/firebase/firebase_collection.dart';
import 'package:bab_el_ezz/firebase/user_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'new_job_state.dart';

class NewJobCubit extends Cubit<NewJobState> {
  NewJobCubit() : super(NewJobInitial());

  static NewJobCubit get(context) => BlocProvider.of(context);
  TextEditingController kMController = TextEditingController();

  CollectionReference techRef = FirebaseCollection().staffCol;
  CollectionReference jobRef = FirebaseCollection().jobOrderCol;

  TextEditingController notesController = TextEditingController();

  List<Technician> technicians = [], selectedTechs = [];
  SpareInvoice? invoice;
  bool returnVisible = false;

  getTechnicians() async {
    final data = await techRef.get();
    technicians = data.docs.map((e) => e.data() as Technician).toList();
    emit(GetData(technicians));
  }

  String? selectedValue;

  void setSelectedClientValue(String? value) {
    selectedValue = value;
    emit(AddClientValueChanged(value));
  }

  String? selectedMaintenanceType;

  void setSelectedMaintenanceType(String? value) {
    selectedMaintenanceType = value;
    emit(AddMaintenanceValueChanged(value));
  }

  bool isTapped1 = false;
  bool isTapped2 = false;

  void cashTapped() {
    isTapped1 = !isTapped1;
    isTapped2 = !isTapped1;
    emit(CashTapped(isTapped1));
  }

  void electronicTapped() {
    isTapped2 = !isTapped2;
    isTapped1 = !isTapped2;
    emit(ElectronicTapped(isTapped2));
  }

  List<DataRow> items = [];

  void addItem(DataRow item) {
    items.add(item);
    emit(AddItems(items.cast<Widget>()));
  }

  void update() {
    emit(ElectronicTapped(isTapped2));
  }

  Future<JobOrder> saveOrder(JobOrder job, bool finished) async {
    print("invoice: ${job.invoice}");
    job.car?.pastOrdersIds?.add(job.id!);
    job
      ..car = (job.car
        ?..mileage = kMController.text
        ..pastOrdersIds = job.car?.pastOrdersIds)
      ..finished = finished
      ..technicians = selectedTechs
      ..endDate = finished ? DateTime.now() : null
      ..invoice = (job.invoice)
      ..notes = notesController.text
      ..maintenanceType = selectedMaintenanceType
      ..paymentType = isTapped1 ? "cash" : "visa";

    if ((await jobRef.doc(job.id).get()).exists) {
      await jobRef.doc(job.id).update(job.toJson());
    } else {
      print("job with id: ${job.id} not found");
      await jobRef.add(job);
    }

    if (finished) {
      DateTime now = DateTime.now();
      //fixme: what if the parts are not in the store??!
      await UserServices.updateTotalStore(
          job.invoice?.price ?? 0, now.month, now.year,
          sell: true);
      PdfGenerator.createPdf(job);
    }

    return job;
  }

  void changeReturnVisiblity(bool visible) {
    returnVisible = visible;
    emit(state);
  }
}
