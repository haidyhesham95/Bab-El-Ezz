import 'package:bab_el_ezz/features/auth/widget/add_logo.dart';
import 'package:bab_el_ezz/features/auth/widget/location.dart';
import 'package:bab_el_ezz/shared_utils/styles/text.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/button_widget.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../generated/assets.dart';
import '../manager/register/register_cubit.dart';

class RegisterView2 extends StatelessWidget {
  const RegisterView2({super.key});

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
                key: cubit.formKey2,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        Assets.imagesLogo1,
                      ),
                      SizedBox(height: 15),
                      TextFieldWidget(
                        label: " اسم الورشة /مركز/محل ",
                        hint: "الاسم",
                        controller: cubit.nameController,
                        errorMessage: "يجب ادخال الاسم",
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(height: 10),
                      TextFieldWidget(
                        label: " اسم الفرع (في حالة وجود فروع) ",
                        hint: "اسم الفرع",
                        controller: cubit.branchNameController,
                        errorMessage: "يجب ادخال اسم الفرع",
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(height: 10),
                      TextFieldWidget(
                        controller: cubit.addressController,
                        errorMessage: "يجب ادخال العنوان",
                        label: " العنوان ",
                        hint: "العنوان",
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(height: 20),
                      Location(),
                      SizedBox(height: 15),
                      TextFieldWidget(
                        controller: cubit.ownerNameController,
                        errorMessage: "يجب ادخال اسم صاحب المركز",
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
                        controller: cubit.passwordController,
                        errorMessage: "يجب ادخال الرقم السري",
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(height: 10),
                      TextFieldWidget(
                        controller: cubit.confirmPasswordController,
                        errorMessage: "يجب تأكيد الرقم السري",
                        titleStyle: AppStyles.styleRegular12(context),
                        hint: "تأكيد الرقم السري ",
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      SizedBox(height: 15),
                       AddLogo(),
                      SizedBox(height: 40),
                      ButtonWidget(
                        height: size.height * 0.06,
                        width: size.width * 0.5,
                        hasElevation: true,
                        text: 'اتمام التسحيل',
                        onPressed: () {
                          if (cubit.formKey2.currentState!.validate()) {
                            Navigator.pushNamed(context, 'login');



                          }
                        },
                      ),
                    ]),
              );
            }),
      ),
    ));
  }
}
