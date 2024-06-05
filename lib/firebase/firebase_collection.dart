import 'package:bab_el_ezz/data/attendance.dart';
import 'package:bab_el_ezz/data/car.dart';
import 'package:bab_el_ezz/data/customer.dart';
import 'package:bab_el_ezz/data/invoice.dart';
import 'package:bab_el_ezz/data/job_order.dart';
import 'package:bab_el_ezz/data/maintenance_invoice.dart';
import 'package:bab_el_ezz/data/merchant.dart';
import 'package:bab_el_ezz/data/part.dart';
import 'package:bab_el_ezz/data/technician.dart';
import 'package:bab_el_ezz/data/workshop.dart';
import 'package:bab_el_ezz/firebase/user_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCollection {
  /// User Collection base on firebase collection name
  static const String staffCollectionName = "Staff";
  static const String attendanceCollectionName = "Attendance";
  static const String jobOrderCollectionName = "Orders";
  static const String workshopCollectionName = "workshops";
  static const String customerCollectionName = "Customers";
  static const String carCollectionName = "Cars";
  static const String partCollectionName = "Parts";
  static const String invoiceCollectionName = "Invoices";
  static const String merchantsCollectionName = "Merchants";

  static final FirebaseCollection _singleton = FirebaseCollection._internal();
  static final Map<Type, CollectionReference<dynamic>> _collectionCache = {};
  late CollectionReference<JobOrder> jobOrderCol;
  late CollectionReference<Technician> staffCol;
  late CollectionReference<Attendance> attendanceCol;
  late CollectionReference<Customer> customerCol;
  late CollectionReference<Workshop> workshopCol;
  late CollectionReference<Car> carCol;
  late CollectionReference<Part> partCol;
  late CollectionReference<Invoice> maintenanceInvCol;
  late CollectionReference<Invoice> merchantInvCol;
  late CollectionReference<Invoice> partsInvCol;
  late CollectionReference<Invoice> returnInvCol;
  late CollectionReference<Merchant> merchantsCol;

  factory FirebaseCollection() {
    return _singleton;
  }

  FirebaseCollection._internal() {
    jobOrderCol = _getOrCreateCollection<JobOrder>(
        collectionName: jobOrderCollectionName,
        fromJson: JobOrder.fromFirestore,
        toJson: (JobOrder model) => model.toJson());
    merchantsCol = _getOrCreateCollection<Merchant>(
        collectionName: merchantsCollectionName,
        fromJson: Merchant.fromFirestore,
        toJson: (Merchant model) => model.toJson());
    maintenanceInvCol = _getOrCreateCollection<MaintenanceInvoice>(
        collectionName: invoiceCollectionName,
        fromJson: MaintenanceInvoice.fromFirestore,
        toJson: (MaintenanceInvoice model) => model.toJson());
    merchantInvCol = _getOrCreateCollection<MaintenanceInvoice>(
        collectionName: invoiceCollectionName,
        fromJson: MaintenanceInvoice.fromFirestore,
        toJson: (MaintenanceInvoice model) => model.toJson());
    partsInvCol = _getOrCreateCollection<MaintenanceInvoice>(
        collectionName: invoiceCollectionName,
        fromJson: MaintenanceInvoice.fromFirestore,
        toJson: (MaintenanceInvoice model) => model.toJson());
    returnInvCol = _getOrCreateCollection<MaintenanceInvoice>(
        collectionName: invoiceCollectionName,
        fromJson: MaintenanceInvoice.fromFirestore,
        toJson: (MaintenanceInvoice model) => model.toJson());
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
