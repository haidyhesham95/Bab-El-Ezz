import 'package:bab_el_ezz/data/daily_expense.dart';
import 'package:bab_el_ezz/firebase/firebase_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'daily_expenses_state.dart';

class DailyExpensesCubit extends Cubit<DailyExpensesState> {
  DailyExpensesCubit() : super(DailyExpensesInitial());
  static DailyExpensesCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController bandController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  CollectionReference expensesRef = FirebaseCollection().dailyExpenseCol;

  List<DailyExpense> dailyExpenses = [];
  double total = 0;

  void addExpense(DailyExpense expense) async {
    dailyExpenses.add(expense);
    total += expense.price;
    await expensesRef.add(expense);
    emit(UpdateData());
  }

  void deleteExpense(DailyExpense expense) async {
    dailyExpenses.removeWhere((e) => e.item == expense.item);
    total -= expense.price;
    final data = await expensesRef.get();
    final doc = data.docs.where((e) {
      DailyExpense expenseItem = e.data() as DailyExpense;
      return expense.item == expenseItem.item && _sameDate(expenseItem);
    }).firstOrNull;
    await doc?.reference.delete();
    emit(UpdateData());
  }

  void getExpenses() async {
    final data = await expensesRef.get();
    dailyExpenses = data.docs
        .where((e) {
          DailyExpense expense = e.data() as DailyExpense;
          return _sameDate(expense);
        })
        .map((e) => e.data() as DailyExpense)
        .toList();
    total = dailyExpenses.fold(0, (p, e) => p + e.price);
    emit(UpdateData());
  }

  bool _sameDate(DailyExpense expense) {
    DateTime now = DateTime.now();

    return expense.date.day == now.day &&
        expense.date.month == now.month &&
        expense.date.year == now.year;
  }

  void updateExpense(DailyExpense expense) {
    int index =
        dailyExpenses.indexWhere((e) => e.date.isAtSameMomentAs(expense.date));
    total -= dailyExpenses[index].price;
    total += expense.price;
    dailyExpenses.removeAt(index);
    dailyExpenses.insert(index, expense);
    emit(UpdateData());
  }
}
