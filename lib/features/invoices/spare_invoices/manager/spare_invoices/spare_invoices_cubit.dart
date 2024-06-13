import 'package:bab_el_ezz/data/customer.dart';
import 'package:bab_el_ezz/data/part.dart';
import 'package:bab_el_ezz/data/spare_invoice.dart';
import 'package:bab_el_ezz/firebase/firebase_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'spare_invoices_state.dart';

class SpareInvoicesCubit extends Cubit<SpareInvoicesState> {
  SpareInvoicesCubit() : super(SpareInvoicesInitial());
  static SpareInvoicesCubit get(context) => BlocProvider.of(context);

  bool isTableVisible = false;

  List<Customer> customers = [];
  List<Part> parts = [];
  List<SpareInvoice> invoices = [];

  CollectionReference partsInvRef = FirebaseCollection().partsInvCol;
  CollectionReference customersRef = FirebaseCollection().partsCustCol;
  CollectionReference partsRef = FirebaseCollection().partCol;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();

  TextEditingController customerNameController = TextEditingController();
  TextEditingController customerPhoneController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  List<DataRow> items = List.from([], growable: true);

  void addItem(DataRow item) {
    print("len: ${items.length}");
    items.insert(0, item);
    print("len2: ${items.length}");
    emit(AddItems(items.cast<Widget>()));
  }

  getCustomers() async {
    final ref = await customersRef.get();
    customers = ref.docs.map((e) => e.data() as Customer).toList();
    emit(UpdateData());
  }

  getParts() async {
    final ref = await partsRef.get();
    parts = ref.docs.map((e) => e.data() as Part).toList();
    emit(UpdateData());
  }

  searchPart(String name) async {
    final data = parts.where((element) => element.name == name).toList();
    emit(SearchData(data));
  }

  void updateTableView(String name, String phone) {
    isTableVisible = true;
    customerNameController.text = name;
    customerPhoneController.text = phone;
    emit(UpdateData());
  }

  void addCustomer(Customer customer) async {
    await customersRef.add(customer);
    updateTableView(customer.name, customer.phoneNumber);
  }

  void searchCustomer() {
    final data = customers
        .where((element) =>
            element.phoneNumber.contains(searchController.text) ||
            element.name.contains(searchController.text))
        .toList();
    emit(SearchData(data));
  }

  void update() {
    emit(UpdateData());
  }
}
