import 'package:bab_el_ezz/data/workshop.dart';
import 'package:bab_el_ezz/features/auth/widget/top_page.dart';
import 'package:bab_el_ezz/firebase/firebase_collection.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/button_widget.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../shared_utils/utils/constant.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  final String DATA_PAGE = "تحليل البيانات";
  final String EMPLOYEES_PAGE = "";
  final String STORE_PAGE = "";

  CollectionReference workshopRef = FirebaseCollection().workshopCol;

  TextEditingController phoneNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController pinController = TextEditingController();

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

  checkPIN(String pageName) async {
    EasyLoading.show();
    final data = await workshopRef.doc("profile").get();
    Workshop workshop = data.data() as Workshop;
    String pin = 'a';
    if (pageName == DATA_PAGE) {
      pin = workshop.dataAnalysisPIN;
    } else if (pageName == EMPLOYEES_PAGE) {
      pin = workshop.employeesPIN;
    } else if (pageName == STORE_PAGE) {
      pin = workshop.storePIN;
    }
    if (pin == pinController.text) {
      emit(UpdateData());
    } else {
      Fluttertoast.showToast(msg: "الرقم غير صحيح");
    }
    EasyLoading.dismiss();
  }

  Widget PINView(LoginCubit cubit, Size size, String pageName) {
    return SingleChildScrollView(
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TopPage(
              text: 'تسجيل الدخول ل$pageName',
            ),
            const SizedBox(height: 20),
            TextFieldWidget(
              controller: cubit.pinController,
              hintText: " الرقم السري ",
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 60),
            ButtonWidget(
              height: size.height * 0.06,
              width: size.width * 0.5,
              hasElevation: true,
              text: 'تسجيل الدخول',
              onPressed: () {
                cubit.checkPIN(pageName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
