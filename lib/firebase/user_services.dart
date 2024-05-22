import 'package:firebase_auth/firebase_auth.dart';

class UserServices {
  static String? getUserId() {
    return FirebaseAuth.instance.currentUser?.uid;
  }
}
