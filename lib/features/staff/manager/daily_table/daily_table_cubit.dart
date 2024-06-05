import 'package:bab_el_ezz/data/attendance.dart';
import 'package:bab_el_ezz/data/technician.dart';
import 'package:bab_el_ezz/firebase/firebase_collection.dart';
import 'package:bab_el_ezz/firebase/user_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'daily_table_state.dart';

class DailyTableCubit extends Cubit<DailyTableState> {
  DailyTableCubit(this.technicians) : super(DailyTableInitial()) {
    statusList = List.generate(technicians.length, (index) => 'اجازة');
    checkIns = List.generate(technicians.length, (index) => null);
    checkOuts = List.generate(technicians.length, (index) => null);

    noteController =
        List.generate(technicians.length, (index) => TextEditingController());
    bonusController =
        List.generate(technicians.length, (index) => TextEditingController());
    deductionController =
        List.generate(technicians.length, (index) => TextEditingController());
    advanceController =
        List.generate(technicians.length, (index) => TextEditingController());
  }

  CollectionReference attendanceRef = FirebaseCollection().attendanceCol;
  CollectionReference staffRef = FirebaseCollection().staffCol;

  final List<Technician> technicians;
  List<Attendance> attends = [];
  late final List<String> statusList;
  late final List<TimeOfDay?> checkIns;
  late final List<TimeOfDay?> checkOuts;

  late List<TextEditingController> noteController;
  late List<TextEditingController> bonusController;
  late List<TextEditingController> deductionController;
  late List<TextEditingController> advanceController;

  static DailyTableCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<Attendance> attendanceList = [];

  void setCheckOutTime(TimeOfDay? value, int index) {
    checkOuts[index] = value!;
    emit(SelectedCheckOutTimeChanged(value));
  }

  void setAttendanceTime(TimeOfDay? value, int index) {
    checkIns[index] = value!;
    emit(SelectedAttendanceChanged(value));
  }

  void setSelectedType(String? value, int index) {
    statusList[index] = value!;
    emit(SelectedTypeChanged(value));
  }

  getTechDetails(String techId, DateTime? lastPayment,
      {bool getAll = false}) async {
    final collectionRef =
        await attendanceRef.doc(techId).collection("attends").get();
    var doc = collectionRef.docs;
    List<Attendance> data = [];
    if (!getAll) {
      data = doc
          .where((element) =>
              (Attendance.fromFirestore(element))
                  .date
                  ?.isAfter(lastPayment ?? DateTime(2020)) ??
              true)
          .map((e) => Attendance.fromFirestore(e))
          .toList();
    } else {
      data = doc.map((e) => Attendance.fromFirestore(e)).toList();
    }
    attends = data;
    emit(UpdateData());
  }

  int getWorkingDays() {
    return attends.fold(
        0,
        (previousValue, element) =>
            previousValue + (element.status == "عمل" ? 1 : 0));
  }

  int getOffDays() {
    return attends.fold(
        0,
        (previousValue, element) =>
            previousValue + (element.status != "عمل" ? 1 : 0));
  }

  double getTotalBonus() {
    return attends.fold(
        0, (previousValue, element) => previousValue + (element.bonus ?? 0));
  }

  double getTotalAdvance() {
    return attends.fold(
        0, (previousValue, element) => previousValue + (element.advance ?? 0));
  }

  double getTotalDeduction() {
    return attends.fold(0,
        (previousValue, element) => previousValue + (element.deduction ?? 0));
  }

  double getTotalPayment(double dailyRate) {
    return attends.fold(
        0,
        (previousValue, element) =>
            previousValue +
            (element.status == "عمل" ? dailyRate : 0) +
            (element.bonus ?? 0) -
            (element.deduction ?? 0) -
            (element.advance ?? 0));
  }

  Future clearAccount(String techId) async {
    await staffRef.doc(techId).update({'lastPayment': DateTime.now()});
  }

  submitDailyData() async {
    String uId = UserServices.getUserId()!;
    print("UID: $uId");
    Attendance attendance;
    for (var element in technicians.indexed) {
      int index = element.$1;
      Technician tech = element.$2;
      attendance = Attendance(
          tech.name,
          tech.id,
          statusList[index],
          checkIns[index],
          checkOuts[index],
          double.tryParse(bonusController[index].text),
          double.tryParse(deductionController[index].text),
          double.tryParse(advanceController[index].text),
          noteController[index].text,
          DateTime.now());
      print("techId: ${tech.id}");
      await attendanceRef
          .doc(tech.id)
          .collection("attends")
          .add(attendance.toJson());
    }
    // getTechDetails(
    //     "31uBAe6DlYxPtETJ7DTe", DateTime.now().subtract(Duration(days: 5)));
  }
}
