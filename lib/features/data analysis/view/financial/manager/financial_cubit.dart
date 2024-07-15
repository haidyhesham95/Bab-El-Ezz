import 'package:bab_el_ezz/data/daily_expense.dart';
import 'package:bab_el_ezz/data/job_order.dart';
import 'package:bab_el_ezz/data/merchant_invoice.dart';
import 'package:bab_el_ezz/data/part.dart';
import 'package:bab_el_ezz/data/spare_invoice.dart';
import 'package:bab_el_ezz/firebase/firebase_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/picker.dart';

part 'financial_state.dart';

class FinancialCubit extends Cubit<FinancialState> {
  FinancialCubit() : super(FinancialInitial());

  static FinancialCubit get(BuildContext context) => BlocProvider.of(context);
  DateTimeRange? selectedRange;

  double net = 0,
      income = 0,
      spending = 0,
      storePrice = 0,
      remaining = 0,
      services = 0,
      spareParts = 0,
      salaries = 0,
      merchantInvoices = 0,
      dailyExpenses = 0;

  CollectionReference ordersRef = FirebaseCollection().jobOrderCol;
  CollectionReference spareInvRef = FirebaseCollection().partsInvCol;
  CollectionReference dailyExpRef = FirebaseCollection().dailyExpenseCol;
  CollectionReference storeRef = FirebaseCollection().partCol;
  CollectionReference merchantInvRef = FirebaseCollection().merchantInvCol;

  populateData() async {
    final orders = await ordersRef.get();
    final invoices = await spareInvRef.get();
    final expenses = await dailyExpRef.get();
    final store = await storeRef.get();
    final merchantInv = await merchantInvRef.get();

    storePrice = store.docs.fold(
        0.0,
        (p, e) =>
            p + //todo: sellingPrice or whole??
            ((e.data() as Part).quantity * (e.data() as Part).sellingPrice));

    remaining = merchantInv.docs.fold(
        0.0, (p, e) => p + ((e.data() as MerchantInvoice).totalRemaining ?? 0));

    calculateIncome(orders, invoices);
    calculateSpending(expenses);

    net = income - spending;

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

  calculateIncome(QuerySnapshot orders, QuerySnapshot invoices) {
    orders.docs.where((e) {
      JobOrder jobOrder = e.data() as JobOrder;

      return (jobOrder.endDate?.isBefore((selectedRange?.end ??
                  jobOrder.endDate!.add(const Duration(seconds: 2)))) ??
              false) &&
          (jobOrder.endDate?.isAfter(selectedRange?.start ??
                  jobOrder.endDate!.subtract(const Duration(seconds: 2))) ??
              false);
    }).forEach((e) {
      JobOrder jobOrder = e.data() as JobOrder;

      income += jobOrder.invoice?.price ?? 0;

      spending +=
          ((jobOrder.technicians?.fold(0.0, (p, e) => p + e.dailyRate) ?? 0) *
              (selectedRange?.end
                      .difference(selectedRange?.start ?? selectedRange!.end)
                      .inDays ??
                  0));
    });

    invoices.docs.where((e) {
      SpareInvoice invoice = e.data() as SpareInvoice;

      return (invoice.date.isBefore((selectedRange?.end ??
              invoice.date.add(const Duration(seconds: 2))))) &&
          (invoice.date.isAfter(selectedRange?.start ??
              invoice.date.subtract(const Duration(seconds: 2))));
    }).forEach((e) {
      SpareInvoice invoice = e.data() as SpareInvoice;
      services += invoice.service;
      income += invoice.price;
    });
  }

  calculateSpending(QuerySnapshot expenses) {
    expenses.docs.where((e) {
      DailyExpense expense = e.data() as DailyExpense;

      return (expense.date.isBefore((selectedRange?.end ??
              expense.date.add(const Duration(seconds: 2))))) &&
          (expense.date.isAfter(selectedRange?.start ??
              expense.date.subtract(const Duration(seconds: 2))));
    }).forEach((e) {
      DailyExpense expense = e.data() as DailyExpense;
      spending += expense.price;
    });
  }
}
