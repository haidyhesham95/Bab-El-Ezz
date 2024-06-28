import 'package:bab_el_ezz/shared_utils/styles/colors.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widget/picker.dart';

part 'financial_state.dart';


class FinancialCubit extends Cubit<FinancialState> {
  FinancialCubit() : super(FinancialInitial()) {
  }

  static FinancialCubit get(BuildContext context) => BlocProvider.of(context);
  DateTimeRange? selectedRange;


  void getDateRange(BuildContext context) async {
    DateTimeRange? range = await AppFunctions.showPickerRange(context, selectedRange);
    if (range != null) {
      selectedRange = range;
      emit(GetRangeDate());
    }
  }



}

