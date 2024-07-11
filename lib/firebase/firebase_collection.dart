import 'package:bab_el_ezz/data/attendance.dart';
import 'package:bab_el_ezz/data/car.dart';
import 'package:bab_el_ezz/data/customer.dart';
import 'package:bab_el_ezz/data/daily_expense.dart';
import 'package:bab_el_ezz/data/invoice.dart';
import 'package:bab_el_ezz/data/job_order.dart';
import 'package:bab_el_ezz/data/maintenance_invoice.dart';
import 'package:bab_el_ezz/data/merchant.dart';
import 'package:bab_el_ezz/data/merchant_invoice.dart';
import 'package:bab_el_ezz/data/part.dart';
import 'package:bab_el_ezz/data/part_customer.dart';
import 'package:bab_el_ezz/data/return_invoice.dart';
import 'package:bab_el_ezz/data/return_part.dart';
import 'package:bab_el_ezz/data/spare_invoice.dart';
import 'package:bab_el_ezz/data/technician.dart';
import 'package:bab_el_ezz/data/workshop.dart';
import 'package:bab_el_ezz/firebase/user_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCollection {
  /// User Collection base on firebase collection name
  static const String staffCollectionName = "Staff";
  static const String attendanceCollectionName = "Attendance";
  static const String jobOrderCollectionName = "Orders";
  static const String workshopCollectionName = "workshop";
  static const String customerCollectionName = "Customers";
  static const String partsCustCollectionName = "Parts Customers";
  static const String carCollectionName = "Cars";
  static const String partCollectionName = "Parts";
  static const String invoiceCollectionName = "Invoices";
  static const String merchantsCollectionName = "Merchants";
  static const String dailyExpenseCollectionName = "Daily Expenses";

  static final FirebaseCollection _singleton = FirebaseCollection._internal();
  static final Map<Type, CollectionReference<dynamic>> _collectionCache = {};
  late CollectionReference<JobOrder> jobOrderCol;
  late CollectionReference<Technician> staffCol;
  late CollectionReference<Attendance> attendanceCol;
  late CollectionReference<Customer> customerCol;
  late CollectionReference<PartCustomer> partsCustCol;
  late CollectionReference<Workshop> workshopCol;
  late CollectionReference<Car> carCol;
  late CollectionReference<Part> partCol;
  late CollectionReference<Invoice> maintenanceInvCol;
  late CollectionReference<Invoice> merchantInvCol;
  late CollectionReference<Invoice> partsInvCol;
  late CollectionReference<Invoice> returnInvCol;
  late CollectionReference<Invoice> returnPartInvCol;
  late CollectionReference<Merchant> merchantsCol;
  late CollectionReference<DailyExpense> dailyExpenseCol;

  factory FirebaseCollection() {
    return _singleton;
  }

  FirebaseCollection._internal() {
    jobOrderCol = _getOrCreateCollection<JobOrder>(
        collectionName: jobOrderCollectionName,
        fromJson: JobOrder.fromFirestore,
        toJson: (JobOrder model) => model.toJson());
    dailyExpenseCol = _getOrCreateCollection<DailyExpense>(
        collectionName: dailyExpenseCollectionName,
        fromJson: DailyExpense.fromFirestore,
        toJson: (DailyExpense model) => model.toJson());
    partsCustCol = _getOrCreateCollection<PartCustomer>(
        collectionName: partsCustCollectionName,
        fromJson: PartCustomer.fromFirestore,
        toJson: (PartCustomer model) => model.toJson());
    merchantsCol = _getOrCreateCollection<Merchant>(
        collectionName: merchantsCollectionName,
        fromJson: Merchant.fromFirestore,
        toJson: (Merchant model) => model.toJson());
    maintenanceInvCol = _getOrCreateCollection<MaintenanceInvoice>(
        collectionName: invoiceCollectionName,
        fromJson: MaintenanceInvoice.fromFirestore,
        toJson: (MaintenanceInvoice model) => model.toJson());
    merchantInvCol = _getOrCreateCollection<MerchantInvoice>(
        collectionName: invoiceCollectionName,
        fromJson: MerchantInvoice.fromFirestore,
        toJson: (MerchantInvoice model) => model.toJson());
    partsInvCol = _getOrCreateCollection<SpareInvoice>(
        collectionName: invoiceCollectionName,
        fromJson: SpareInvoice.fromFirestore,
        toJson: (SpareInvoice model) => model.toJson());
    returnInvCol = _getOrCreateCollection<ReturnInvoice>(
        collectionName: invoiceCollectionName,
        fromJson: ReturnInvoice.fromFirestore,
        toJson: (ReturnInvoice model) => model.toJson());
    returnPartInvCol = _getOrCreateCollection<ReturnPart>(
        collectionName: invoiceCollectionName,
        fromJson: ReturnPart.fromFirestore,
        toJson: (ReturnPart model) => model.toJson());
    partCol = _getOrCreateCollection<Part>(
        collectionName: partCollectionName,
        fromJson: Part.fromFirestore,
        toJson: (Part model) => model.toJson());
    staffCol = _getOrCreateCollection<Technician>(
        collectionName: staffCollectionName,
        fromJson: Technician.fromFirestore,
        toJson: (Technician model) => model.toJson());
    attendanceCol = _getOrCreateCollection<Attendance>(
        collectionName: attendanceCollectionName,
        fromJson: Attendance.fromFirestore,
        toJson: (Attendance model) => model.toJson());
    customerCol = _getOrCreateCollection<Customer>(
        collectionName: customerCollectionName,
        fromJson: Customer.fromFirestore,
        toJson: (Customer model) => model.toJson());
    carCol = _getOrCreateCollection<Car>(
        collectionName: carCollectionName,
        fromJson: Car.fromFirestore,
        toJson: (Car model) => model.toJson());
    workshopCol = _getOrCreateCollection<Workshop>(
        collectionName: workshopCollectionName,
        fromJson: Workshop.fromFirestore,
        toJson: (Workshop model) => model.toJson());
  }

  static CollectionReference<T> _getOrCreateCollection<T>(
      {required String collectionName,
      required T Function(DocumentSnapshot doc) fromJson,
      required Map<String, dynamic> Function(T model) toJson}) {
    final type = T;
    if (_collectionCache.containsKey(type)) {
      return _collectionCache[type] as CollectionReference<T>;
    }
    final collection = FirebaseFirestore.instance
        .collection("shops")
        .doc(UserServices.getUserId()!)
        .collection(collectionName)
        .withConverter<T>(
          fromFirestore: (snapshot, _) => fromJson(snapshot),
          toFirestore: (value, _) => toJson(value),
        );
    _collectionCache[type] = collection;
    return collection;
  }
}
