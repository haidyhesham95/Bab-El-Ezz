import 'package:bab_el_ezz/data/job_order.dart';
import 'package:bab_el_ezz/firebase/firebase_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../financial/widget/picker.dart';

part 'employee_state.dart';

class EmployeeCubit extends Cubit<EmployeeState> {
  EmployeeCubit() : super(EmployeeInitial());

  static EmployeeCubit get(BuildContext context) => BlocProvider.of(context);

  DateTimeRange? selectedRange;
  CollectionReference ordersRef = FirebaseCollection().jobOrderCol;
  Map<String, int> techCars = {};

  getTechs() async {
    final data = await ordersRef.get();
    techCars.clear();

    print("Fetched data: ${data.docs.map((e) => e.data()).toList()}");

    // Using where and map correctly
    data.docs.where((e) {
      JobOrder order = e.data() as JobOrder;

      print("Evaluating order: ${order.toJson()}");

      bool isWithinRange = (order.endDate?.isBefore(
                selectedRange?.end ?? order.endDate!.add(Duration(seconds: 2)),
              ) ??
              false) &&
          (order.endDate?.isAfter(
                selectedRange?.start ??
                    order.endDate!.subtract(Duration(seconds: 2)),
              ) ??
              false);

      print("Is within range: $isWithinRange");

      return isWithinRange;
    }).forEach((e) {
      JobOrder order = e.data() as JobOrder;
      print("techs: ${order.technicians?.map((e) => e.name)}");

      order.technicians?.forEach((technician) {
        if (techCars.containsKey(technician.name)) {
          techCars[technician.name] = techCars[technician.name]! + 1;
        } else {
          techCars[technician.name] = 1;
        }
      });
    });

    emit(UpdateData());
  }

  void getDateRange(BuildContext context) async {
    DateTimeRange? range =
        await AppFunctions.showPickerRange(context, selectedRange);
    if (range != null) {
      selectedRange = range;
      emit(GetRangeDate());
    }
  }
}
