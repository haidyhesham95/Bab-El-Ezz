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

  static String _convertToSixDgts(int n) {
    return n.toString().padLeft(6, "0");
  }
}
