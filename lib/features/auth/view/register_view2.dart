import 'package:bab_el_ezz/shared_utils/styles/text.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/button_widget.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../generated/assets.dart';
import '../../../shared_utils/styles/colors.dart';

class RegisterView2 extends StatelessWidget {
  const RegisterView2({super.key});

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
                  children: [
                    Image.asset(
                      Assets.imagesLogo1,
                    ),
                    SizedBox(height: 15),

                    TextFieldWidget(
                      label: " اسم الورشة /مركز/محل ",
                      hint: "الاسم",
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,

                    ),

                    SizedBox(height: 10),

                    TextFieldWidget(
                      label: " اسم الفرع (في حالة وجود فروع) ",
                      hint: "اسم الفرع",
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 10),

                    TextFieldWidget(
                      label: " العنوان ",
                      hint: "العنوان",
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                    ),

                    SizedBox(height: 20),
                    Container(
                      height: size.height * 0.08,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorsAsset.kGreen,
                          width: 1,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            Assets.imagesLocation,
                          ),
                          SizedBox(width: 20),
                          Text(
                            'الموقع',
                            style: AppStyles.styleMedium16(context).copyWith(color: Colors.black),
                          ),

                        ],
                      )

                    ),
                    SizedBox(height: 15),

                    TextFieldWidget(
                      label: " اسم صاحب المركز ",
                      hint: "الاسم",
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 10),

                    TextFieldWidget(
                      label: " رقم هاتف آخر للتواصل(اختياري) ",
                      hint: " رقم الهاتف  ",
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                    ),

                    SizedBox(height: 10),

                    TextFieldWidget(
                      label: " الرقم السري لتحليل البيانات ",
                      hint: "الرقم السري ",
                      isPassword: true,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(height: 5),
                    TextFieldWidget(
                      label: "(يجب ان يحتوي علي 6 خانات) ",
                      titleStyle: AppStyles.styleRegular12(context),
                      hint: "تأكيد الرقم السري ",
                      isPassword: true,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    SizedBox(height: 15),
                    Text(
                      'إضافة شعار للمركز',
                      style: AppStyles.styleBold15(context),
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                      height: size.height * 0.15,
                      width: size.width * 0.5,
                      child: Card(
                        color: Colors.white,
                        child:SvgPicture.asset(Assets.imagesAddImage,
                          fit: BoxFit.scaleDown, ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'في حالة عدم وجود شعار للمركز اتصل للمساعدة 0100000',
                      style: AppStyles.styleRegular16(context),
                    ),

                    SizedBox(height: 40),
                    ButtonWidget(
                      height: size.height * 0.06,
                      width: size.width * 0.5,
                      hasElevation: true,
                      text: 'اتمام التسحيل',
                      onPressed: () {
                        Navigator.pushNamed(context, 'login');
                      },
                    ),


                  ]),

          )),
    );
  }

}
