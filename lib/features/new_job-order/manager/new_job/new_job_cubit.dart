import 'dart:ui';

import 'package:bab_el_ezz/data/car.dart';
import 'package:bab_el_ezz/data/job_order.dart';
import 'package:bab_el_ezz/data/spare_invoice.dart';
import 'package:bab_el_ezz/data/technician.dart';
import 'package:bab_el_ezz/features/new_job-order/widgets/create_pdf.dart';
import 'package:bab_el_ezz/firebase/firebase_collection.dart';
import 'package:bab_el_ezz/firebase/user_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

part 'new_job_state.dart';

class NewJobCubit extends Cubit<NewJobState> {
  NewJobCubit() : super(NewJobInitial());

  static NewJobCubit get(context) => BlocProvider.of(context);
  TextEditingController kMController = TextEditingController();

  CollectionReference techRef = FirebaseCollection().staffCol;
  CollectionReference jobRef = FirebaseCollection().jobOrderCol;
  CollectionReference carRef = FirebaseCollection().carCol;

  TextEditingController notesController = TextEditingController();

  List<Technician> technicians = [], selectedTechs = [];
  SpareInvoice? invoice;
  bool returnVisible = false;
  List<JobOrder> pastOrders = [];

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

  getPastOrders(String carPlate) async {
    final data = await carRef.where('licensePlate', isEqualTo: carPlate).get();

    List<String> pastIds = (data.docs.first.data() as Car).pastOrdersIds ?? [];
    print("pastIds: $pastIds");

    for (String id in pastIds) {
      DocumentSnapshot doc = await jobRef.doc(id).get();
      if (doc.exists) {
        pastOrders.add(doc.data() as JobOrder);
      }
    }
    emit(UpdateData());
  }

  Future<JobOrder> saveOrder(
      JobOrder job, bool finished, GlobalKey imageKey, bool pastOrder) async {
    EasyLoading.show();

    print("invoice: ${job.invoice}");
    final imageLink = await captureAndUpload(imageKey);
    print("imageLink: $imageLink");

    String? id;

    /// Get a new id for job order if it's already past
    if (pastOrder) {
      final x = await jobRef.add('');
      id = x.id;
      job.id = id;
    }

    job
      ..car = (job.car?..mileage = kMController.text)
      ..finished = finished
      ..technicians = selectedTechs
      ..endDate = finished ? DateTime.now() : null
      ..invoice = (job.invoice)
      ..notes = notesController.text
      ..maintenanceType = selectedMaintenanceType
      ..carImage = imageLink
      ..paymentType = isTapped1 ? "cash" : "visa";

    if ((await jobRef.doc(job.id).get()).exists) {
      await jobRef.doc(job.id).update(job.toJson());
    } else {
      print("job with id: ${job.id} not found");
      await jobRef.add(job);
    }

    if (finished) {
      final data = await carRef
          .where('licensePlate', isEqualTo: job.car?.licensePlate)
          .get();
      final List jobIds = data.docs.map((e) => e.data() as String).toList();
      jobIds.add(id ?? job.id);
      data.docs.first.reference.update({'pastOrdersIds': jobIds});

      DateTime now = DateTime.now();
      await UserServices.updateTotalStore(
          job.invoice?.price ?? 0, now.month, now.year,
          sell: true);
      PdfGenerator.createPdf(job);
    }
    EasyLoading.dismiss();
    return job;
  }

  void changeReturnVisiblity(bool visible) {
    returnVisible = visible;
    emit(state);
  }

  Future<String> captureAndUpload(GlobalKey globalKey) async {
    RenderRepaintBoundary boundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    var image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();

    // Upload the pngBytes to Firebase Storage
    return await _uploadToFirebase(pngBytes);
  }

  Future<String> _uploadToFirebase(Uint8List pngBytes) async {
    // Initialize Firebase
    // await Firebase.initializeApp(); // Uncomment if Firebase isn't initialized

    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage
        .ref()
        .child("images/${DateTime.now().millisecondsSinceEpoch}.png");
    UploadTask uploadTask = ref.putData(pngBytes);
    final task = await uploadTask.whenComplete(() => print("Upload complete"));
    return await task.ref.getDownloadURL();
  }
}
