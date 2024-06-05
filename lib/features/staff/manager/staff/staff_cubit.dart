import 'package:bab_el_ezz/data/attendance.dart';
import 'package:bab_el_ezz/data/technician.dart';
import 'package:bab_el_ezz/firebase/firebase_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'staff_state.dart';

class StaffCubit extends Cubit<StaffState> {
  StaffCubit() : super(StaffInitial());

  static StaffCubit get(context) => BlocProvider.of(context);

  int selectedIndex = 0;
  List<Technician> technicians = [];
  List<Attendance> attendances = [];
  CollectionReference techniciansRef = FirebaseCollection().staffCol;
  CollectionReference attendanceRef = FirebaseCollection().attendanceCol;

  void changeIndex(int index) {
    selectedIndex = index;
    emit(ChangeSelectedIndex(index));
  }

  updateTechnicians(Technician technician, {bool update = false}) {
    int index = update
        ? technicians.indexOf(
            technicians.where((element) => technician.id == element.id).first)
        : 0;
    technicians.removeWhere((element) => element.id == technician.id);
    update
        ? technicians.insert(index, technician)
        : technicians.add(technician);

    //add attendance for the tech. if he's new
    if (!update) {
      attendances.add(Attendance.empty(technician.id ?? '', technician.name));
    }
    emit(ChangeSelectedIndex(selectedIndex));
  }

  getTechnicians() async {
    technicians.clear();
    QuerySnapshot snapshot = await techniciansRef.get();
    technicians = snapshot.docs.map((e) => e.data()! as Technician).toList();
    emit(ChangeSelectedIndex(selectedIndex));
  }

  getAttendances() async {
    attendances.clear();
    QuerySnapshot snapshot = await attendanceRef.get();
    attendances = snapshot.docs.map((e) => e.data()! as Attendance).toList();
    emit(ChangeSelectedIndex(selectedIndex));
  }

  // deleteAttendance(String technicianId) async {
  //   await attendanceRef.where('technicianId', isEqualTo: technicianId);
  // }

  deleteTechnician(Technician technician) async {
    await techniciansRef.doc(technician.id).delete();
    technicians.remove(technician);
    emit(ChangeSelectedIndex(selectedIndex));
  }
}
