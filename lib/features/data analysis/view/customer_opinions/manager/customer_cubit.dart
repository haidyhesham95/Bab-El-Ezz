import 'package:bab_el_ezz/features/data%20analysis/view/financial/widget/picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'customer_state.dart';

class CustomerCubit extends Cubit<CustomerState> {
  CustomerCubit() : super(CustomerInitial());

  static CustomerCubit get(BuildContext context) => BlocProvider.of(context);

  DateTimeRange? selectedRange;


  void getDateRange(BuildContext context) async {
    DateTimeRange? range = await AppFunctions.showPickerRange(context, selectedRange);
    if (range != null) {
      selectedRange = range;
      emit(GetRangeDate());
    }
  }
}
