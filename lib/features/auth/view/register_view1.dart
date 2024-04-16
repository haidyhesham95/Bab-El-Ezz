import 'package:bab_el_ezz/shared_utils/styles/text.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/button_widget.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/text_field.dart';
import 'package:flutter/material.dart';
import '../../../generated/assets.dart';

class RegisterView1 extends StatelessWidget {
  const RegisterView1({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body:   SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child:
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Assets.imagesLogo,
                    ),
                    Align(
                      widthFactor: 2.6,
                      alignment: Alignment.centerRight,
                      child: Text(
                        'انشاء حساب جديد',
                        style: AppStyles.styleExtraBold20(context),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFieldWidget(
                      hint: "رقم الهاتف",
                      textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone

                    ),
                    SizedBox(height: 5),
                    TextFieldWidget(
                      hint: "الرقم السري ",
                      isPassword: true,
                        textInputAction: TextInputAction.next,

                        keyboardType: TextInputType.visiblePassword

                    ),
                    SizedBox(height: 10),
                    TextFieldWidget(
                      label: "(يجب ان يحتوي علي 6 خانات) ",
                        titleStyle: AppStyles.styleRegular12(context),
                        hint: "تأكيد الرقم السري ",
                      isPassword: true,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword
                    ),

                    SizedBox(height: 40),
                    ButtonWidget(
                      height: size.height * 0.06,
                      width: size.width * 0.5,
                      hasElevation: true,
                      text: 'التالي',
                      onPressed: () {},
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'لديك حساب؟',
                          style: AppStyles.styleRegular16(context),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'قم بتسجيل الدخول',
                            style: AppStyles.styleBold16(context)
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    )
                  ]),

          )),
    );
  }
}
