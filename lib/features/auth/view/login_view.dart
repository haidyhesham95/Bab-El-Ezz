import 'package:bab_el_ezz/shared_utils/styles/text.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/button_widget.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/text_field.dart';
import 'package:flutter/material.dart';
import '../../../generated/assets.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
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
          widthFactor: 3.2,
          alignment: Alignment.centerRight,
          child: Text(
            'تسجيل الدخول',
            style: AppStyles.styleExtraBold20(context),
          ),
        ),
        SizedBox(height: 20),
        TextFieldWidget(
          hint: "رقم الهاتف",
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,


        ),
        SizedBox(height: 5),
        TextFieldWidget(
          hint: "الرقم السري ",
          isPassword: true,
            keyboardType: TextInputType.visiblePassword,
            trailingIcon: Icon(Icons.remove_red_eye_outlined),
          textInputAction: TextInputAction.next,
        ),
        SizedBox(height: 10),
        Align(
            widthFactor: 3.4,
            alignment: Alignment.centerRight,
            child: Text(
              'هل نسيت كلمة السر؟',
              style: AppStyles.styleRegular14(context),
            )),
        SizedBox(height: 60),
        ButtonWidget(
          height: size.height * 0.06,
          width: size.width * 0.5,
          hasElevation: true,
          text: 'تسجيل الدخول',
          onPressed: () {},
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ليس لديك حساب؟',
              style: AppStyles.styleRegular16(context),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'register1');
              },
              child: Text(
                'قم بانشاء حساب',
                style: AppStyles.styleBold16(context)
                    .copyWith(color: Colors.white),
              ),
            ),
          ],
        )
      ]),
        ),
      ),
    );
  }
}
