import 'package:bab_el_ezz/data/job_order.dart';
import 'package:bab_el_ezz/firebase/firebase_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_client_state.dart';

class SearchClientCubit extends Cubit<SearchClientState> {
  SearchClientCubit() : super(SearchClientInitial());
  static SearchClientCubit get(context) => BlocProvider.of(context);

  final ordersRef = FirebaseCollection().jobOrderCol;
  List<JobOrder> jobOrders = [];

  getJobOrders() async {
    QuerySnapshot snapshot = await ordersRef.get();
    // print("orders: ${snapshot.docs.length}");
    // jobOrders.clear();

    final data = snapshot.docs.map((e) {
      var data = e.data();
      print("data: $data");
      return (data as JobOrder);
    }).toList();
    jobOrders = data;
    print(data.length);
    emit(GetData(data));
  }

  searchJobOrders(String query) {
    final data = jobOrders.where((jobOrder) {
      final clientName = jobOrder.clientName!.toLowerCase();
      final phoneNumber = jobOrder.phoneNumber!.toLowerCase();
      final licensePlate = jobOrder.car!.licensePlate!.toLowerCase();
      final lowerCaseQuery = query.toLowerCase();

      return clientName.contains(lowerCaseQuery) ||
          phoneNumber.contains(lowerCaseQuery) ||
          licensePlate.contains(lowerCaseQuery);
    }).toList();

    emit(GetData(data));
  }
}
