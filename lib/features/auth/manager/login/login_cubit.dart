import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared_utils/utils/constant.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phoneNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isShowLoginPassword = true;

  void changeLoginPasswordVisibility() {
    isShowLoginPassword = !isShowLoginPassword;
    emit(ShowPasswordInLogin());
  }

  login(BuildContext context) async {
    String email = "${phoneNameController.text}$EMAIL_POSTFIX";
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: email, password: passwordController.text)
        .then((e) {
      Navigator.pushNamed(context, "layout");
    });
  }
}
