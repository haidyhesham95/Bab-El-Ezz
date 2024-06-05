import 'package:bab_el_ezz/data/attendance.dart';
import 'package:bab_el_ezz/data/technician.dart';
import 'package:bab_el_ezz/firebase/firebase_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'staff_table_state.dart';

class StaffTableCubit extends Cubit<StaffTableState> {
  StaffTableCubit() : super(StaffTableInitial());
  static StaffTableCubit get(context) => BlocProvider.of(context);

  final CollectionReference staffRef = FirebaseCollection().staffCol;
  final CollectionReference attendanceRef = FirebaseCollection().attendanceCol;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController nationalIdController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController dailyRateController = TextEditingController();

  TextEditingController specializationController = TextEditingController();

  Future addTechnician(Technician technician) async {
    await staffRef.add(technician).then((value) {
      attendanceRef
          .doc(technician.id)
          .set(Attendance.empty(value.id ?? '', technician.name));
    }).onError((error, stackTrace) {
      print("error: $error");
      return Future.error("error");
    });
  }

  Future updateTechnician(Technician technician) async {
    print("id: ${technician.id}, tech: ${technician.toJson()}");
    await staffRef.doc(technician.id).update(technician.toJson());
  }
}
