import 'dart:io';

import 'package:bab_el_ezz/data/invoice.dart';
import 'package:bab_el_ezz/data/merchant.dart';
import 'package:bab_el_ezz/firebase/firebase_collection.dart';
import 'package:bab_el_ezz/firebase/user_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';

part 'supplier_invoice_state.dart';

class SupplierInvoiceCubit extends Cubit<SupplierInvoiceState> {
  SupplierInvoiceCubit() : super(SupplierInvoiceInitial());

  // Form Keys
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();

  // Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController invoiceNumberController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController paidController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController aglController = TextEditingController();
  final TextEditingController dueDateController = TextEditingController();

  // Firestore References
  final CollectionReference merchantRef = FirebaseCollection().merchantsCol;
  final CollectionReference maintenanceInvRef =
      FirebaseCollection().maintenanceInvCol;
  final CollectionReference merchantInvRef =
      FirebaseCollection().merchantInvCol;
  final CollectionReference partsInvRef = FirebaseCollection().partsInvCol;
  final CollectionReference returnInvRef = FirebaseCollection().returnInvCol;

  // State variables
  String? selectedMerchant;
  List<Invoice> invoices = [];
  List<Merchant> merchants = [];
  bool showAll = false;

  // Helper methods
  static SupplierInvoiceCubit get(context) => BlocProvider.of(context);

  String _getInvoiceDocumentId(Invoice invoice, String type) {
    return "${invoice.invoiceNumber}_${invoice.id}_$type";
  }

  String _getImagePath(Invoice invoice) {
    return "images/${UserServices.getUserId()!}/${invoice.id}.jpg";
  }

  // Data fetching and manipulation
  Future<void> getMerchants() async {
    final data = await merchantRef.get();
    merchants = data.docs.map((e) => e.data() as Merchant).toList();
    emit(SearchData(merchants));
  }

  Future<void> getInvoices(String type) async {
    QuerySnapshot data;
    if (type == "merchant") {
      data = await merchantInvRef.get();
    } else if (type == "maintenance") {
      data = await maintenanceInvRef.get();
    } else if (type == "return") {
      data = await returnInvRef.get();
    } else {
      throw ArgumentError("Invalid invoice type: $type");
    }

    invoices = data.docs
        .where((element) => element.id.contains(type))
        .map((e) => e.data() as Invoice)
        .toList();
    emit(SearchData(invoices));
  }

  Future<void> updateMerchants(Merchant merchant, {bool update = false}) async {
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

  // Search functionality
  void searchInvoices(String query) {
    final data = invoices.where((invoice) {
      final merchantName = invoice.clientName.toLowerCase();
      final invoiceNumber = invoice.invoiceNumber.toLowerCase();
      final lowerCaseQuery = query.toLowerCase();

      return merchantName.contains(lowerCaseQuery) ||
          invoiceNumber.contains(lowerCaseQuery);
    }).toList();

    emit(SearchData(data));
  }

  void searchMerchant(String query) {
    print("query: $query");
    final data = merchants.where((merchant) {
      final name = merchant.name.toLowerCase();
      final phone = merchant.phone.toLowerCase();
      final company = merchant.company.toLowerCase();
      final lowerCaseQuery = query.toLowerCase();
      print(
          "name: $name, query: $query, matches: ${name.contains(lowerCaseQuery)}");

      return company.contains(lowerCaseQuery) ||
          name.contains(lowerCaseQuery) ||
          phone.contains(lowerCaseQuery);
    }).toList();

    emit(SearchData(data));
  }

  // CRUD operations
  Future<void> addInvoice(Invoice invoice, String type) async {
    try {
      invoices.add(invoice);
      if (type.contains("merchant")) {
        await merchantInvRef
            .doc(_getInvoiceDocumentId(invoice, type))
            .set(invoice);
      } else if (type.contains("maintenance")) {
        await maintenanceInvRef
            .doc(_getInvoiceDocumentId(invoice, type))
            .set(invoice);
      } else if (type.contains("return")) {
        await returnInvRef
            .doc(_getInvoiceDocumentId(invoice, type))
            .set(invoice);
      }
      emit(SearchData(invoices));
    } catch (e) {
      // ... error handling
    }
  }

  void deleteMerchant(Merchant merchant) async {
    merchants.removeWhere((element) => element.id == merchant.id);
    await merchantRef.doc(merchant.id).delete();
    emit(SearchData(merchants));
  }

  void deleteInvoice(Invoice invoice) async {
    invoices.removeWhere((element) => element.id == invoice.id);
    await maintenanceInvRef.doc(invoice.id).delete();
    emit(SearchData(invoices));
  }

  // Image handling
  Future<String> uploadImage(File? file, String invoiceId) async {
    if (file == null) return Future.error("File is null");
    final storageRef = FirebaseStorage.instance
        .ref()
        .child("images")
        .child(UserServices.getUserId()!)
        .child("$invoiceId.jpg");
    print("invoiceId: $invoiceId");
    final snapshot =
        await storageRef.putFile(file).onError((error, stackTrace) {
      print("error: $error");
      return Future.error("error");
    });
    return await snapshot.ref.getDownloadURL();
  }

  Future<void> downloadAndOpenImage(Invoice invoice) async {
    try {
      final storageRef =
          FirebaseStorage.instance.ref().child(_getImagePath(invoice));
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/${invoice.id}.jpg');

      if (await file.exists()) {
        await OpenFile.open(file.path);
      } else {
        final downloadTask = storageRef.writeToFile(file);
        try {
          await downloadTask;
          await OpenFile.open(file.path);
        } catch (e) {
          // ... error handling
        }
      }
    } catch (e) {
      // ... error handling
    }
  }

  void updateShowAll() {
    showAll = !showAll;
    emit(UpdateData());
  }

  void update() {
    emit(UpdateData());
  }
}
