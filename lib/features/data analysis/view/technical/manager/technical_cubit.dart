import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../financial/widget/picker.dart';

part 'technical_state.dart';

class TechnicalCubit extends Cubit<TechnicalState> {
  TechnicalCubit() : super(TechnicalInitial());

  static TechnicalCubit get(BuildContext context) => BlocProvider.of(context);

  DateTimeRange? selectedRange;


  void getDateRange(BuildContext context) async {
    DateTimeRange? range = await AppFunctions.showPickerRange(context, selectedRange);
    if (range != null) {
      selectedRange = range;
      emit(GetRangeDate());
    }
  }

}

