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
  TextEditingController dateController = TextEditingController();
  TextEditingController paidController = TextEditingController();
  TextEditingController aglController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();




  CollectionReference merchantRef = FirebaseCollection().merchantsCol;
  CollectionReference merchantInvRef = FirebaseCollection().merchantInvCol;

  String? selectedSupplierType;
  List<MerchantInvoice> merchantInvoices = [];
  List<Merchant> merchants = [];

  void setSelectedSupplierType(String? value) {
    selectedSupplierType = value;
    emit(AddSupplierValueChanged(value));
  }

  Future addMerchant(Merchant merchant) async {
    merchants.add(merchant);
    await merchantRef.add(merchant);
    emit(UpdateData());
  }

  update() {
    emit(UpdateData());
  }

  getMerchants() async {
    final data = await merchantRef.get();
    merchants = data.docs.map((e) => e.data() as Merchant).toList();
    emit(UpdateData());
  }

  deleteMerchant(Merchant merchant) async {
    merchants.removeWhere((element) => element.id == merchant.id);
    await merchantRef.doc(merchant.id).delete();
    emit(UpdateData());
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

  Future updateTechnicians(Merchant merchant, {bool update = false}) async {
    int index = update
        ? merchants.indexOf(
            merchants.where((element) => merchant.id == element.id).first)
        : 0;
    merchants.removeWhere((element) => element.id == merchant.id);
    update ? merchants.insert(index, merchant) : merchants.add(merchant);

    if (update) await merchantRef.doc(merchant.id).update(merchant.toJson());

    emit(UpdateData());
  }

  String getRandomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(random.nextInt(chars.length))));
  }
}
