import 'dart:math';

import 'package:bab_el_ezz/data/merchant.dart';
import 'package:bab_el_ezz/data/merchant_invoice.dart';
import 'package:bab_el_ezz/firebase/firebase_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'supplier_invoice_state.dart';

class SupplierInvoiceCubit extends Cubit<SupplierInvoiceState> {
  SupplierInvoiceCubit() : super(SupplierInvoiceInitial());

  static SupplierInvoiceCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController invoiceNumberController = TextEditingController();

  CollectionReference merchantRef = FirebaseCollection().merchantsCol;
  CollectionReference merchantInvRef = FirebaseCollection().merchantInvCol;

  String? selectedSupplierType;
  List<MerchantInvoice> merchantInvoices = [];
  List<Merchant> merchants = [];
  bool showAllDataSuppliers = false;

  updateShowAll() {
    showAllDataSuppliers = !showAllDataSuppliers;
    emit(UpdateData());
  }

  void setSelectedSupplierType(String? value) {
    selectedSupplierType = value;
    emit(AddSupplierValueChanged(value));
  }

  searchMerchantInv(String query) {
    final data = merchantInvoices.where((invoice) {
      final merchantName = invoice.clientName!.toLowerCase();
      final invoiceNumber = invoice.invoiceNumber!.toLowerCase();
      final lowerCaseQuery = query.toLowerCase();

      return merchantName.contains(lowerCaseQuery) ||
          invoiceNumber.contains(lowerCaseQuery);
    }).toList();

    emit(SearchData(data));
  }

  searchMerchant(String query) {
    print("query: $query");
    final data = merchants.where((invoice) {
      final name = invoice.name.toLowerCase();
      final phone = invoice.phone.toLowerCase();
      final company = invoice.company.toLowerCase();
      final lowerCaseQuery = query.toLowerCase();
      print(
          "name: $name, query: $query, matches: ${name.contains(lowerCaseQuery)}");

      return company.contains(lowerCaseQuery) ||
          name.contains(lowerCaseQuery) ||
          phone.contains(lowerCaseQuery);
    }).toList();

    emit(SearchData(data));
  }

  update() {
    emit(UpdateData());
  }

  getMerchants() async {
    final data = await merchantRef.get();
    merchants = data.docs.map((e) => e.data() as Merchant).toList();
    emit(SearchData(merchants));
  }

  deleteMerchant(Merchant merchant) async {
    merchants.removeWhere((element) => element.id == merchant.id);
    await merchantRef.doc(merchant.id).delete();
    emit(SearchData(merchants));
  }

  getMerchantInv() async {
    final data = await merchantInvRef.get();
    merchantInvoices = data.docs
        .where((element) => element.id.contains("merchant"))
        .map((e) => e.data() as MerchantInvoice)
        .toList();
    emit(UpdateData());
  }

  deleteMerchantInv(MerchantInvoice invoice) async {
    merchantInvoices.removeWhere((element) => element.id == invoice.id);
    await merchantInvRef.doc(invoice.id).delete();
    emit(UpdateData());
  }

  addMerchantInv(MerchantInvoice invoice) async {
    merchantInvoices.add(invoice);
    await merchantInvRef
        .doc("${invoice.invoiceNumber}_${invoice.id}_merchant")
        .set(invoice);
    emit(UpdateData());
  }

  Future updateMerchants(Merchant merchant, {bool update = false}) async {
    print("id: ${merchant.id}");
    int index = update
        ? merchants.indexOf(
            merchants.where((element) => merchant.id == element.id).first)
        : 0;

    //remove the element to update it
    merchants.removeWhere((element) => element.id == merchant.id);
    update ? merchants.insert(index, merchant) : merchants.add(merchant);

    if (update) {
      await merchantRef.doc(merchant.id).update(merchant.toJson());
    } else {
      await merchantRef.add(merchant);
    }

    emit(SearchData(merchants));
  }

  String getRandomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(random.nextInt(chars.length))));
  }
}
