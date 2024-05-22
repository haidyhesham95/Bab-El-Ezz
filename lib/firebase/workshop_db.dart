import 'package:bab_el_ezz/data/workshop.dart';
import 'package:bab_el_ezz/firebase/firebase_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WorkshopDB {
  static final WorkshopDB _instance = WorkshopDB._internal();
  late FirebaseCollection firebaseCollection;

  factory WorkshopDB() {
    return _instance;
  }
  WorkshopDB._internal() {
    firebaseCollection = FirebaseCollection();
  }

  Future<QuerySnapshot<Workshop>> getWorkshop() async {
    return FirebaseCollection().workshopCol.get();
  }

  Future addWorkShop(Workshop workshop) async {
    return firebaseCollection.workshopCol.add(workshop);
  }
}
