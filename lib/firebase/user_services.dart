import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserServices {
  static String? getUserId() {
    return FirebaseAuth.instance.currentUser?.uid;
  }

  static Future<String> getLastInvoiceNumber() async {
    final ref =
        FirebaseFirestore.instance.collection("shops").doc(getUserId()!);
    final data = await ref.get();
    if (data.data()!['last_invoice'] != null) {
      return _convertToSixDgts(data.data()!['last_invoice'] as int);
    } else {
      ref.set({'last_invoice': 0});
      return _convertToSixDgts(0);
    }
  }

  static Future updateLastInvoiceNumber() async {
    final ref =
        FirebaseFirestore.instance.collection("shops").doc(getUserId()!);
    final data = await ref.get();
    if (data.exists) {
      ref.update({'last_invoice': FieldValue.increment(1)});
    } else {
      ref.set({'last_invoice': 0});
    }
  }

  static Future getTotalStore(int year) async {
    final ref =
        FirebaseFirestore.instance.collection("shops").doc(getUserId()!);
    final data = await ref.get();

    if (data.data()!['total_store_$year'] != null) {
      return data.data()!['total_store_$year'] as List;
    } else {
      ref.set({
        'total_store_$year':
            FieldValue.arrayUnion(List.generate(12, (e) => 0.0))
      });
      return List.generate(12, (e) => 0);
    }
  }

  static updateTotalStore(double total, int month, int year,
      {required bool sell}) async {
    final ref =
        FirebaseFirestore.instance.collection("shops").doc(getUserId()!);
    final data = await ref.get();

    if (data.exists) {
      List list = await getTotalStore(year);
      if (sell) {
        list[month] -= total;
      } else {
        list[month] += total;
      }
      await ref.update({'total_store_$year': list});
    } else {
      await ref.set({
        'total_store': FieldValue.arrayUnion(List.generate(12, (e) => 0.0))
      });
    }
  }

  static String _convertToSixDgts(int n) {
    return n.toString().padLeft(6, "0");
  }
}
