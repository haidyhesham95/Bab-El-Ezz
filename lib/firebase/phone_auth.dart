import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhoneAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static final PhoneAuth _instance = PhoneAuth._internal();
  static late BuildContext context;

  PhoneAuth._internal();

  factory PhoneAuth(BuildContext context) {
    PhoneAuth.context = context;
    return _instance;
  }
  // 1. Verify Phone Number (Initiate OTP)
  Future<void> verifyPhoneNumber(String phoneNumber) async {
    // Handle null or empty phone number
    if (phoneNumber.isEmpty) {
      return Future.error("أدخل رقم هاتف");
    }

    // Show a loading indicator while waiting for verification
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => const AlertDialog(
        title: Text('Verifying Phone Number'),
        content: CircularProgressIndicator(),
      ),
    );

    // Start phone number verification
    await _auth
        .verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
        print("authentication successful");
        // Auto-verification completed (rare)
        _auth.signInWithCredential(phoneAuthCredential);
        Navigator.pop(context); // Dismiss loading dialog
      },
      verificationFailed: (FirebaseAuthException exception) {
        Navigator.pop(context); // Dismiss loading dialog
        // Handle verification failure (e.g., network issues, invalid number)
        print('Verification failed: $exception');
      },
      codeSent: (String verificationId, int? resendToken) async {
        Navigator.pop(context); // Dismiss loading dialog
        // OTP sent, proceed to receive and verify the code
        String? enteredCode = await showTextInputDialog(context);
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: enteredCode!,
        );
        await _auth
            .signInWithCredential(credential)
            .then((value) => Navigator.of(context).pushNamed("layout"))
            .onError((error, stackTrace) {
          print("OTP error: $error");
          return Future.error("error");
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Handle code auto-retrieval timeout (rare)
        print('Code auto-retrieval timed out: $verificationId');
      },
    )
        .timeout(const Duration(seconds: 10), onTimeout: () {
      print("timeout");
    });
  }

  // 2. Show Dialog to Enter OTP (Optional)
  Future<String?> showTextInputDialog(BuildContext context) async {
    final codeController = TextEditingController();
    return await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter OTP'),
          content: TextField(
            controller: codeController,
            keyboardType: TextInputType.number,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Submit'),
              onPressed: () => Navigator.pop(context, codeController.text),
            ),
          ],
        );
      },
    );
  }
}
