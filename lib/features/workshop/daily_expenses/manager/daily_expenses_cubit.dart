import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'daily_expenses_state.dart';

class DailyExpensesCubit extends Cubit<DailyExpensesState> {
  DailyExpensesCubit() : super(DailyExpensesInitial());
  static DailyExpensesCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController bandController = TextEditingController();
  TextEditingController priceController = TextEditingController();
}
