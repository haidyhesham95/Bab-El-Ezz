import 'package:bab_el_ezz/features/auth/widget/check_account_text.dart';
import 'package:bab_el_ezz/features/auth/widget/top_page.dart';
import 'package:bab_el_ezz/shared_utils/styles/text.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/button_widget.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/register/register_cubit.dart';

class RegisterView1 extends StatelessWidget {
  const RegisterView1({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {},
          builder: (context, state) {
            RegisterCubit cubit = RegisterCubit.get(context);
            return Form(
              key: cubit.formKey1,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TopPage(
                      text: 'انشاء حساب جديد',
                      widthFactor: 2.7,
                    ),
                    const SizedBox(height: 20),
                    TextFieldWidget(
                        errorMessage: 'رقم الهاتف يجب ان يحتوي علي 11 خانات',
                        controller: cubit.phoneNameController,
                        hintText: " رقم الهاتف",
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone),
                    const SizedBox(height: 5),
                    TextFieldWidget(
                        errorMessage: 'الرقم السري يجب ان يحتوي علي 6 خانات',
                        controller: cubit.passwordController,
                        hintText: " الرقم السري ",
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.visiblePassword),
                    const SizedBox(height: 10),
                    TextFieldWidget(
                        controller: cubit.confirmPasswordController,
                        errorMessage: 'الرقم السري يجب ان يحتوي علي 6 خانات',
                        titleStyle: AppStyles.styleRegular12(context),
                        hintText: " تأكيد الرقم السري  ",
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword),
                    const SizedBox(height: 40),
                    ButtonWidget(
                      height: size.height * 0.06,
                      width: size.width * 0.5,
                      hasElevation: true,
                      text: 'التالي',
                      onPressed: () {
                        if (cubit.formKey1.currentState!.validate() &&
                            cubit.passwordController.text ==
                                cubit.confirmPasswordController.text) {
                          Navigator.pushNamed(context, 'register2', arguments: [
                            cubit.phoneNameController.text,
                            cubit.passwordController.text
                          ]);
                        }
                      },
                    ),
                    CheckAccountText(
                        text1: 'لديك حساب؟',
                        text2: 'قم بتسجيل الدخول',
                        onPressed: () {
                          Navigator.pushNamed(context, 'login');
                        }),
                  ]),
            );
          },
        ),
      )),
    );
  }
}
