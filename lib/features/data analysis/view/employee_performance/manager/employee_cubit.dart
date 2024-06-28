import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../shared_utils/styles/colors.dart';
import '../../financial/widget/picker.dart';

part 'employee_state.dart';



class EmployeeCubit extends Cubit<EmployeeState> {
  EmployeeCubit() : super(EmployeeInitial()) {
  }

  static EmployeeCubit  get(BuildContext context) => BlocProvider.of(context);

  DateTimeRange? selectedRange;


  void getDateRange(BuildContext context) async {
    DateTimeRange? range = await AppFunctions.showPickerRange(context, selectedRange);
    if (range != null) {
      selectedRange = range;
      emit(GetRangeDate());
    }
  }}
