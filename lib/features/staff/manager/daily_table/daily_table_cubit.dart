import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'daily_table_state.dart';

class DailyTableCubit extends Cubit<DailyTableState> {
  DailyTableCubit() : super(DailyTableInitial());

  static DailyTableCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  String? CheckOutTime;

  void setCheckOutTime(String? value) {
    CheckOutTime = value;
    emit(SelectedCheckOutTimeChanged(value));
  }


  String? AttendanceTime;

  void setAttendanceTime(String? value) {
    AttendanceTime = value;
    emit(SelectedAttendanceChanged(value));
  }


  String? selectedType;

  void setSelectedType(String? value) {
    selectedType = value;
    emit(SelectedTypeChanged(value));
  }

}
