import 'package:bab_el_ezz/features/auth/manager/login/login_cubit.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/button_widget.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widget/check_account_text.dart';
import '../widget/forget_password.dart';
import '../widget/top_page.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {},
            builder: (context, state) {
            LoginCubit cubit = LoginCubit.get(context);
            return Form(
              key: cubit.formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TopPage(
                      text: 'تسجيل الدخول',
                    ),
                    SizedBox(height: 20),
                    TextFieldWidget(
                      controller: cubit.phoneNameController,
                      hint: " رقم الهاتف",
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
                      errorMessage: '(رقم الهاتف يجب ان يحتوي علي 11 خانات)',
                    ),
                    SizedBox(height: 5),
                    TextFieldWidget(
                      controller: cubit.passwordController,
                      hint: " الرقم السري ",
                      errorMessage: '(الرقم السري يجب ان يحتوي علي 6 خانات)',
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      obscureText: cubit.isShowLoginPassword,
                      trailingIcon: GestureDetector(
                        onTap: () {
                          cubit.changeLoginPasswordVisibility();
                        },
                        child: Visibility(
                          visible: !cubit.isShowLoginPassword,
                          replacement: const Icon(Icons.visibility_off),
                          child: const Icon(Icons.visibility),
                        ),
                      ),
                    ),
                    forgetPassword(context),
                    SizedBox(height: 60),
                    ButtonWidget(
                      height: size.height * 0.06,
                      width: size.width * 0.5,
                      hasElevation: true,
                      text: 'تسجيل الدخول',
                      onPressed: () {
                        if (cubit.formKey.currentState!.validate()) {

                          cubit.phoneNameController.text = '';
                          cubit.passwordController.text = '';
                        }
                      },
                    ),
                    CheckAccountText(
                        text1: 'ليس لديك حساب؟',
                        text2: 'قم بانشاء حساب',
                        onPressed: () {
                          Navigator.pushNamed(context, 'register1');
                        }),
                  ],),
            );
    }),
        ),
      ),
    );
  }
}
