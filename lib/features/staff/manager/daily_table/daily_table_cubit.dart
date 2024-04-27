import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'daily_table_state.dart';

class DailyTableCubit extends Cubit<DailyTableState> {
  DailyTableCubit() : super(DailyTableInitial());

  static DailyTableCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();




  String? selectedType;

  void setSelectedType(String? value) {
    selectedType = value;
    emit(SelectedTypeChanged(value));
  }

}
