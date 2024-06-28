import 'package:bab_el_ezz/data/technician.dart';
import 'package:bab_el_ezz/firebase/firebase_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'new_job_state.dart';

class NewJobCubit extends Cubit<NewJobState> {
  NewJobCubit() : super(NewJobInitial());

  static NewJobCubit get(context) => BlocProvider.of(context);
  TextEditingController kMController = TextEditingController();

  CollectionReference techRef = FirebaseCollection().staffCol;

  List<Technician> technicians = [];

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
}
