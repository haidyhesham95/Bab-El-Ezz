import 'package:bab_el_ezz/data/daily_expense.dart';
import 'package:bab_el_ezz/data/invoice.dart';
import 'package:bab_el_ezz/data/job_order.dart';
import 'package:bab_el_ezz/data/merchant_invoice.dart';
import 'package:bab_el_ezz/data/part.dart';
import 'package:bab_el_ezz/data/return_invoice.dart';
import 'package:bab_el_ezz/data/return_part.dart';
import 'package:bab_el_ezz/data/spare_invoice.dart';
import 'package:bab_el_ezz/firebase/firebase_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared_utils/utils/constant.dart';
import '../widget/picker.dart';

part 'financial_state.dart';

class FinancialCubit extends Cubit<FinancialState> {
  FinancialCubit() : super(FinancialInitial());

  static FinancialCubit get(BuildContext context) => BlocProvider.of(context);
  DateTimeRange? selectedRange;
  List<Part> parts = [];
  List<double> monthlyNetIncome = List.generate(12, (e) => 0);

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
  CollectionReference returnInvRef = FirebaseCollection().returnInvCol;

  populateData() async {
    print("data");
    final orders = await ordersRef.get();
    final invoices = await spareInvRef.get();
    final expenses = await dailyExpRef.get();
    final store = await storeRef.get();
    final merchantInv = await merchantInvRef.get();

    print("orders: ${orders.docs.length}");
    parts = store.docs.map((e) => e.data() as Part).toList();

    storePrice = store.docs.fold(
        0.0,
        (p, e) =>
            p +
            ((e.data() as Part).quantity *
                ((e.data() as Part).sellingPrice ?? 0)));

    remaining = merchantInv.docs.fold(
        0.0, (p, e) => p + ((e.data() as MerchantInvoice).totalRemaining ?? 0));
    merchantInvoices = merchantInv.docs
        .fold(0.0, (p, e) => p + ((e.data() as MerchantInvoice).price));

    calculateIncome(orders, invoices);
    calculateSpending(expenses);

    net = income - spending;
    print("income: $income");
    print("spending: $spending");
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

      // don't return unfinished jobs
      // if selectedRange is null, return from the start of current year
      return (jobOrder.endDate?.isBefore(
                  (selectedRange?.end ?? DateTime(DateTime.now().year + 1))) ??
              false) &&
          (jobOrder.endDate?.isAfter(
                  selectedRange?.start ?? DateTime(DateTime.now().year)) ??
              false);
    }).forEach((e) {
      JobOrder jobOrder = e.data() as JobOrder;

      income += jobOrder.invoice?.price ?? 0;
      monthlyNetIncome[jobOrder.endDate?.month ?? 0] +=
          jobOrder.invoice?.price ?? 0;

      double salary = ((jobOrder.technicians
                  ?.fold(0.0, (p, e) => p + e.dailyRate) ??
              0) *
          ((jobOrder.endDate
                          ?.difference(jobOrder.startDate ?? jobOrder.endDate!)
                          .inHours ??
                      0) /
                  24)
              .ceilToDouble());

      salaries += salary;
      spending += salary;
      monthlyNetIncome[jobOrder.endDate?.month ?? 0] -= salary;
    });

    invoices.docs.where((e) {
      SpareInvoice invoice = e.data() as SpareInvoice;

      // if invoice data is null, return false
      // if selectedRange is null, return from the start of current year
      return (invoice.date.isBefore(
              (selectedRange?.end ?? DateTime(DateTime.now().year + 1)))) &&
          (invoice.date
              .isAfter(selectedRange?.start ?? DateTime(DateTime.now().year)));
    }).forEach((e) {
      if (e.id == _getInvoiceDocumentId(e.data() as Invoice, INVOICE_SPARE)) {
        SpareInvoice invoice = e.data() as SpareInvoice;
        services += invoice.service;
        for (var i in invoice.parts) {
          spareParts += (i.quantity * (i.sellingPrice ?? 0));
        }
        income += invoice.price;
        monthlyNetIncome[invoice.date.month] += invoice.price;
      } else if (e.id ==
          _getInvoiceDocumentId(e.data() as Invoice, INVOICE_RETURN)) {
        ReturnPart invoice = e.data() as ReturnPart;
        double unitPrice;
        unitPrice = (invoice.quantity * invoice.price);
        income -= unitPrice;
        if (invoice.status == "تالف وسيتم استبداله" ||
            invoice.status == "سليم") {
          storePrice += unitPrice;
        }
        monthlyNetIncome[invoice.date.month] -= unitPrice;
      } else if (e.id ==
          _getInvoiceDocumentId(e.data() as Invoice, INVOICE_MERCHANT_RETURN)) {
        ReturnInvoice invoice = e.data() as ReturnInvoice;
        double unitPrice;
        for (var i in invoice.parts) {
          unitPrice = (i.quantity * i.price);
          if (i.status == "مرتجع") {
            spending -= unitPrice;
            storePrice -= unitPrice;
          }
          monthlyNetIncome[invoice.date.month] += unitPrice;
        }
      }
    });
  }

  calculateSpending(QuerySnapshot expenses) {
    expenses.docs.where((e) {
      DailyExpense expense = e.data() as DailyExpense;

      return (expense.date.isBefore(
              (selectedRange?.end ?? DateTime(DateTime.now().year + 1)))) &&
          (expense.date
              .isAfter(selectedRange?.start ?? DateTime(DateTime.now().year)));
    }).forEach((e) {
      DailyExpense expense = e.data() as DailyExpense;
      dailyExpenses += expense.price;
      spending += expense.price;

      monthlyNetIncome[expense.date.month] -= expense.price;
    });
  }

  String _getInvoiceDocumentId(Invoice invoice, String type) {
    return "${invoice.invoiceNumber}_$type";
  }
}
