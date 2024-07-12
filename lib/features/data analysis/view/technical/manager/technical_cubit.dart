import 'package:bab_el_ezz/data/customer.dart';
import 'package:bab_el_ezz/data/job_order.dart';
import 'package:bab_el_ezz/data/spare_invoice.dart';
import 'package:bab_el_ezz/firebase/firebase_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../financial/widget/picker.dart';

part 'technical_state.dart';

class TechnicalCubit extends Cubit<TechnicalState> {
  TechnicalCubit() : super(TechnicalInitial());

  static TechnicalCubit get(BuildContext context) => BlocProvider.of(context);

  DateTimeRange? selectedRange;
  int newClients = 0, currentClients = 0, numOrders = 0;
  Map<String, int> partUsageCounts = {};

  CollectionReference ordersRef = FirebaseCollection().jobOrderCol;
  CollectionReference partsInvRef = FirebaseCollection().partsInvCol;
  CollectionReference merchantsRef = FirebaseCollection().merchantsCol;
  CollectionReference customersRef = FirebaseCollection().customerCol;
  CollectionReference customersPartRef = FirebaseCollection().partsCustCol;

  List<QueryDocumentSnapshot> customersList = [];
  List<JobOrder> jobOrders = [];

  getData() async {
    print("getData");
    final orders = await ordersRef.get();
    final merchants = await merchantsRef.get();
    final partsCust = await customersPartRef.get();
    final customers = await customersRef.get();
    customersList.addAll(customers.docs);
    customersList.addAll(partsCust.docs);

    // int total =
    //     orders.docs.length + merchants.docs.length + customers!.docs.length;

    newClients = customers!.docs.where((e) {
      Customer customer = e.data() as Customer;
      return (customer.created?.isBefore((selectedRange?.end ??
                  customer.created!.add(Duration(seconds: 2)))) ??
              true) &&
          (customer.created?.isAfter(selectedRange?.start ??
                  customer.created!.subtract(Duration(seconds: 2))) ??
              true);
    }).length;

    currentClients = customers!.docs.length;
    numOrders = orders.docs.length;
    jobOrders.clear();

    orders.docs.where((e) {
      JobOrder jobOrder = e.data() as JobOrder;

      return (jobOrder.endDate?.isBefore((selectedRange?.end ??
                  jobOrder.endDate!.add(Duration(seconds: 2)))) ??
              false) &&
          (jobOrder.endDate?.isAfter(selectedRange?.start ??
                  jobOrder.endDate!.subtract(Duration(seconds: 2))) ??
              false);
    }).forEach((e) {
      JobOrder jobOrder = e.data() as JobOrder;
      jobOrders.add(jobOrder);
    });

    emit(UpdateData());
  }

  getPartsData() async {
    final invoiceData = await partsInvRef.get();
    final ordersData = await ordersRef.get();

    for (var data in ordersData.docs) {
      JobOrder order = data.data() as JobOrder;
      if (order.invoice == null) continue;
      for (var part in order.invoice!.parts) {
        if (partUsageCounts.containsKey(part.name)) {
          partUsageCounts[part.name] =
              partUsageCounts[part.name]! + part.quantity;
        } else {
          partUsageCounts[part.name] = 1;
        }
      }
    }

    for (var data in invoiceData.docs) {
      SpareInvoice invoice = data.data() as SpareInvoice;
      for (var part in invoice.parts) {
        if (partUsageCounts.containsKey(part.name)) {
          partUsageCounts[part.name] =
              partUsageCounts[part.name]! + part.quantity;
        } else {
          partUsageCounts[part.name] = 1;
        }
      }
    }
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
}
