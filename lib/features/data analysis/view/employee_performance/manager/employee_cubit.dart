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
  List<JobOrder> jobOrders = [];

  getTechs() async {
    final data = await ordersRef.get();
    techCars.clear();
    jobOrders.clear();

    // print("Fetched data: ${data.docs.map((e) => e.data()).toList()}");

    // Using where and map correctly
    data.docs.where((e) {
      JobOrder jobOrder = e.data() as JobOrder;

      bool isWithinRange = (jobOrder.endDate?.isBefore((selectedRange?.end ??
                  jobOrder.endDate!.add(Duration(seconds: 2)))) ??
              false) &&
          (jobOrder.endDate?.isAfter(selectedRange?.start ??
                  jobOrder.endDate!.subtract(Duration(seconds: 2))) ??
              false);

      return isWithinRange;
    }).forEach((e) {
      JobOrder order = e.data() as JobOrder;
      jobOrders.add(order);
      // print("techs: ${order.technicians?.map((e) => e.name)}");

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
