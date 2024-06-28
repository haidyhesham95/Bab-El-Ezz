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

  final TextEditingController partController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController totalController = TextEditingController();
  final TextEditingController discountController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

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
  SpareInvoice invoice = SpareInvoice.empty();

  void addItem(DataRow item, {int index = 0}) {
    items.insert(index, item);
    emit(AddItems(items.cast<Widget>()));
  }

  void updateTotalPrice(DataRow dataRow) {
    items.removeLast();
    addItem(dataRow, index: items.length);
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
