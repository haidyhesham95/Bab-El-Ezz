import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../shared_utils/utils/constant.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  TextEditingController phoneNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isShowLoginPassword = true;

  void changeLoginPasswordVisibility() {
    isShowLoginPassword = !isShowLoginPassword;
    emit(ShowPasswordInLogin());
  }

  login(BuildContext context) async {
    EasyLoading.show();
    String email = "${phoneNameController.text}$EMAIL_POSTFIX";
    print("email: $email");
    print("password: ${passwordController.text}");
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: email, password: passwordController.text)
        .whenComplete(() => EasyLoading.dismiss())
        .then((e) {
      Navigator.pushNamed(context, "layout");
    }, onError: (error) {
      if (error is FirebaseAuthException) {
        FirebaseAuthException exception = error;
        print(exception.code);
        if (exception.code.contains("user-not-found")) {
          Fluttertoast.showToast(msg: "المستخدم غير موجود");
        } else if (exception.code.contains("wrong-password") ||
            exception.code.contains("invalid-credential")) {
          Fluttertoast.showToast(msg: "الموبايل/كلمة السر غير صحيح");
        }
      }
    });
  }
}
