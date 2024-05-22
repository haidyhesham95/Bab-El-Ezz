import 'package:bab_el_ezz/firebase/phone_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  login(BuildContext context) {
    PhoneAuth(context)
        .verifyPhoneNumber("+12345678901")
        .onError((error, stackTrace) {
      print("Error: $error");
    });
  }
}
