import 'package:bab_el_ezz/data/car.dart';
import 'package:bab_el_ezz/data/customer.dart';
import 'package:bab_el_ezz/data/job_order.dart';
import 'package:bab_el_ezz/data/workshop.dart';
import 'package:bab_el_ezz/firebase/user_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCollection {
  /// User Collection base on firebase collection name
  // static const String userCollectionName = "Users";
  static const String jobOrderCollectionName = "Orders";
  static const String workshopCollectionName = "workshops";
  static const String customerCollectionName = "Customers";
  static const String carCollectionName = "Cars";

  static final FirebaseCollection _singleton = FirebaseCollection._internal();
  static final Map<Type, CollectionReference<dynamic>> _collectionCache = {};
  late CollectionReference<JobOrder> jobOrderCol;
  late CollectionReference<Customer> customerCol;
  late CollectionReference<Workshop> workshopCol;
  late CollectionReference<Car> carCol;

  factory FirebaseCollection() {
    return _singleton;
  }

  FirebaseCollection._internal() {
    jobOrderCol = _getOrCreateCollection<JobOrder>(
        collectionName: jobOrderCollectionName,
        fromJson: JobOrder.fromFirestore,
        toJson: (JobOrder model) => model.toJson());
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
