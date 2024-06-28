import 'dart:io';

import 'package:bab_el_ezz/data/customer.dart';
import 'package:bab_el_ezz/data/invoice.dart';
import 'package:bab_el_ezz/data/merchant.dart';
import 'package:bab_el_ezz/data/merchant_invoice.dart';
import 'package:bab_el_ezz/data/part.dart';
import 'package:bab_el_ezz/data/return_invoice.dart';
import 'package:bab_el_ezz/data/return_part.dart';
import 'package:bab_el_ezz/data/spare_invoice.dart';
import 'package:bab_el_ezz/firebase/firebase_collection.dart';
import 'package:bab_el_ezz/firebase/user_services.dart';
import 'package:bab_el_ezz/shared_utils/utils/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';

part 'supplier_invoice_state.dart';

class InvoiceCubit extends Cubit<InvoiceState> {
  InvoiceCubit() : super(SupplierInvoiceInitial());

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

  double totalPaid = 0;
  double totalPrice = 0;
  double totalRemaining = 0;

  // Firestore References
  final CollectionReference merchantRef = FirebaseCollection().merchantsCol;
  final CollectionReference maintenanceInvRef =
      FirebaseCollection().maintenanceInvCol;
  final CollectionReference merchantInvRef =
      FirebaseCollection().merchantInvCol;
  final CollectionReference partsInvRef = FirebaseCollection().partsInvCol;
  final CollectionReference returnInvRef = FirebaseCollection().returnInvCol;
  final CollectionReference returnPartInvRef =
      FirebaseCollection().returnPartInvCol;
  final CollectionReference partsRef = FirebaseCollection().partCol;
  final CollectionReference partsCustRef = FirebaseCollection().partsCustCol;

  // State variables
  String? selectedMerchant;
  List<Invoice> invoices = [];
  List<Merchant> merchants = [];
  List<Customer> customers = [];
  bool showAll = false;

  // Helper methods
  static InvoiceCubit get(context) => BlocProvider.of(context);

  String _getInvoiceDocumentId(Invoice invoice, String type) {
    return "${invoice.invoiceNumber}_$type";
  }

  String _getImagePath(Invoice invoice) {
    return "images/${UserServices.getUserId()!}/${invoice.invoiceNumber}.jpg";
  }

  // Data fetching and manipulation
  Future<void> getMerchants() async {
    final data = await merchantRef.get();
    merchants = data.docs.map((e) => e.data() as Merchant).toList();
    emit(SearchData(merchants));
  }

  Future<void> getInvoices(String type) async {
    QuerySnapshot data;
    if (type == INVOICE_MERCHANT) {
      data = await merchantInvRef.get();
    } else if (type == INVOICE_MAINTENANCE) {
      data = await maintenanceInvRef.get();
    } else if (type == INVOICE_MERCHANT_RETURN) {
      data = await returnInvRef.get();
    } else if (type == INVOICE_RETURN) {
      data = await returnPartInvRef.get();
    } else if (type == INVOICE_SPARE) {
      data = await partsInvRef.get();
    } else {
      throw ArgumentError("Invalid invoice type: $type");
    }

    invoices = data.docs
        .where((element) => element.id.contains(type))
        .map((e) => e.data() as Invoice)
        .toList();
    emit(SearchData(invoices));
  }

  List<SpareInvoice> getUniqueSpareInvoicesByClientName(
      List<SpareInvoice> invoices) {
    final uniqueInvoices = <String, SpareInvoice>{};

    for (final invoice in invoices) {
      uniqueInvoices[invoice.clientName] = invoice;
    }

    return uniqueInvoices.values.toList();
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
      final phone = invoice.phoneNumber.toLowerCase();
      String? partName;
      if (invoice is ReturnPart) {
        partName = invoice.name;
      }
      final lowerCaseQuery = query.toLowerCase();

      return merchantName.contains(lowerCaseQuery) ||
          invoiceNumber.contains(lowerCaseQuery) ||
          (partName != null ? partName.contains(lowerCaseQuery) : false) ||
          phone.contains(lowerCaseQuery);
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
      if (invoice.invoiceNumber.isEmpty) {
        invoice.invoiceNumber = await UserServices.getLastInvoiceNumber();
      }
      print("invoice number: ${invoice.invoiceNumber}");
      if (type == INVOICE_MERCHANT) {
        await merchantInvRef
            .doc(_getInvoiceDocumentId(invoice, type))
            .set(invoice)
            .then((value) async {
          await updateMerchantInvoice(invoice);
        });
      } else if (type.contains(INVOICE_MAINTENANCE)) {
        await maintenanceInvRef
            .doc(_getInvoiceDocumentId(invoice, type))
            .set(invoice);
      } else if (type == INVOICE_MERCHANT_RETURN) {
        String id = _getInvoiceDocumentId(invoice, type);
        await returnInvRef
            .doc(id)
            .set(invoice)
            .then((value) => print("completed"))
            .onError((error, stackTrace) => print("error: $error"));
      } else if (type == INVOICE_RETURN) {
        await returnPartInvRef
            .doc(_getInvoiceDocumentId(invoice, type))
            .set(invoice);
      } else if (type.contains(INVOICE_SPARE)) {
        await partsInvRef
            .doc(_getInvoiceDocumentId(invoice, type))
            .set(invoice)
            .onError((error, stackTrace) => print("error: $error"))
            .then((value) => (invoice as SpareInvoice).parts.forEach((element) {
                  updatePartStock(element);
                }));
      }
      await UserServices.updateLastInvoiceNumber();
      emit(SearchData(invoices));
    } catch (e) {
      // ... error handling
      print(e);
    }
  }

  Future updateInvoice(Invoice invoice, String type) async {
    print("invoice number: ${invoice.invoiceNumber}");
    print("invoices: ${invoices.map((e) => e.invoiceNumber)}");
    int index = invoices.indexWhere(
        (element) => invoice.invoiceNumber == element.invoiceNumber);
    invoices.removeAt(index);
    invoices.insert(index, invoice);

    if (type == INVOICE_MERCHANT) {
      await merchantInvRef
          .doc(_getInvoiceDocumentId(invoice, type))
          .update((invoice as MerchantInvoice).toJson());
      await updateMerchantInvoice(invoice, update: true);
    } else if (type == INVOICE_MERCHANT_RETURN) {
      await returnInvRef
          .doc(_getInvoiceDocumentId(invoice, type))
          .update((invoice as ReturnInvoice).toJson());
    } else if (type == INVOICE_RETURN) {
      await returnPartInvRef
          .doc(_getInvoiceDocumentId(invoice, type))
          .update((invoice as ReturnPart).toJson());
    }
    emit(SearchData(invoices));
  }

  updatePartStock(Part part) async {
    final data = await partsRef.get();
    final docs = data.docs
        .where((element) => (element.data() as Part).code == part.code);
    //todo if reached threshold, issue a notification
    if (docs.isNotEmpty) {
      for (var element in docs) {
        element.reference.update({
          'quantity': (docs.toList()[0].get('quantity') as int) - part.quantity
        });
      }
    }
  }

  void deleteMerchant(Merchant merchant) async {
    merchants.removeWhere((element) => element.id == merchant.id);
    await merchantRef.doc(merchant.id).delete();
    emit(SearchData(merchants));
  }

  void deleteCustomer(SpareInvoice invoice) async {
    final doc = await partsCustRef
        .where('phoneNumber', isEqualTo: invoice.phoneNumber)
        .get();
    //delete customer
    await doc.docs.first.reference.delete().then((value) async =>
        //delete customer's invoices
        (await partsInvRef
                .where('phoneNumber', isEqualTo: invoice.phoneNumber)
                .get())
            .docs
            .forEach((element) {
          element.reference.delete();
        }));
    invoices
        .removeWhere((element) => element.phoneNumber == invoice.phoneNumber);
    emit(SearchData(invoices));
  }

  void deleteInvoice(Invoice invoice, String type) async {
    print("invoice: ${invoice.invoiceNumber}");
    invoices.removeWhere(
        (element) => element.invoiceNumber == invoice.invoiceNumber);
    if (type == INVOICE_MAINTENANCE) {
      await maintenanceInvRef
          .doc(_getInvoiceDocumentId(invoice, type))
          .delete();
    } else if (type == INVOICE_SPARE) {
      await partsInvRef.doc(_getInvoiceDocumentId(invoice, type)).delete();
    } else if (type == INVOICE_MERCHANT) {
      await merchantInvRef.doc(_getInvoiceDocumentId(invoice, type)).delete();
      await updateMerchantInvoice(invoice, increase: -1);
    } else if (type == INVOICE_MERCHANT_RETURN) {
      await returnInvRef.doc(_getInvoiceDocumentId(invoice, type)).delete();
    } else if (type == INVOICE_RETURN) {
      await returnPartInvRef.doc(_getInvoiceDocumentId(invoice, type)).delete();
    }
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
      print("ref: ${storageRef.fullPath}");
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/${invoice.invoiceNumber}.jpg');

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

  void addCustomer(Customer customer) async {
    await partsCustRef.add(customer);
    invoices.add(SpareInvoice.empty()
      ..clientName = customer.name
      ..phoneNumber = customer.phoneNumber);
    emit(SearchData(invoices));
  }

  void updateCustomer(Customer customer, String oldPhone) async {
    final doc =
        await partsCustRef.where('phoneNumber', isEqualTo: oldPhone).get();
    final data = doc.docs.first;
    if (data.exists) {
      await data.reference.update(customer.toJson());
      final doc =
          await partsInvRef.where('phoneNumber', isEqualTo: oldPhone).get();
      doc.docs.forEach((element) async {
        await element.reference.update(
            {'clientName': customer.name, 'phoneNumber': customer.phoneNumber});
      });
    }
    invoices
        .where((element) => element.phoneNumber == oldPhone)
        .forEach((element) {
      element.phoneNumber = customer.phoneNumber;
      element.clientName = customer.name;
    });
    emit(UpdateData());
  }

  Future updateMerchantInvoice(Invoice invoice,
      {int increase = 1, bool update = false}) async {
    final data =
        await merchantRef.where('name', isEqualTo: invoice.clientName).get();
    print("invoice: ${(invoice as MerchantInvoice).toJson()}");
    data.docs.first.reference.update({
      'totalInvoices': FieldValue.increment(update ? 0 : increase),
      'totalPrice': FieldValue.increment(
          update ? (invoice.price - totalPrice) : invoice.price * increase),
      'totalPaid': FieldValue.increment(update
          ? ((invoice).totalPaid ?? totalPaid - totalPaid)
          : ((invoice).totalPaid ?? 0) * increase),
      'totalRemaining': FieldValue.increment(update
          ? (invoice.totalRemaining ?? totalRemaining - totalRemaining)
          : ((invoice).totalRemaining ?? 0) * increase)
    });
  }
}
