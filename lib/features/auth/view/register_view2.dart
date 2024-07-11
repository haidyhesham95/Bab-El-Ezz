import 'dart:io';

import 'package:bab_el_ezz/data/workshop.dart';
import 'package:bab_el_ezz/features/auth/widget/add_logo.dart';
import 'package:bab_el_ezz/features/invoices/invoices/widget/add_image.dart';
import 'package:bab_el_ezz/firebase/firebase_collection.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/button_widget.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../generated/assets.dart';
import '../manager/register/register_cubit.dart';

class RegisterView2 extends StatelessWidget {
  RegisterView2({super.key});

  String phone = '';
  String password = '';
  File? imageFile;
  List<String>? data;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    data = ModalRoute.of(context)?.settings.arguments as List<String>?;
    if (data != null && data!.length == 2) {
      phone = data![0];
      password = data![1];
      print("reg2: $password");
    }

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
                      const SizedBox(height: 15),
                      TextFieldWidget(
                        label: " اسم الورشة /مركز/محل ",
                        hintText: "الاسم",
                        controller: cubit.workshopNameController,
                        errorMessage: "يجب ادخال الاسم",
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 10),
                      TextFieldWidget(
                        label: " اسم الفرع (في حالة وجود فروع) ",
                        hintText: "اسم الفرع",
                        controller: cubit.branchNameController,
                        errorMessage: "يجب ادخال اسم الفرع",
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        validator: (val) => null,
                      ),
                      const SizedBox(height: 10),
                      TextFieldWidget(
                        controller: cubit.addressController,
                        errorMessage: "يجب ادخال العنوان",
                        label: " العنوان ",
                        hintText: " ادخال العنوان",
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 20),
                      // const Location(),
                      const SizedBox(height: 15),
                      TextFieldWidget(
                        controller: cubit.ownerNameController,
                        errorMessage: "يجب ادخال اسم صاحب المركز",
                        label: " اسم صاحب المركز ",
                        hintText: "الاسم",
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 10),
                      TextFieldWidget(
                        label: " رقم هاتف آخر للتواصل(اختياري) ",
                        hintText: " +20 ",
                        controller: cubit.phoneController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        errorMessage: "يجب ادخال رقم الهاتف",
                        validator: (val) => null,
                      ),
                      const SizedBox(height: 10),
                      TextFieldWidget(
                        label: " الرقم السري لتحليل البيانات ",
                        hintText: "الرقم السري ",
                        controller: cubit.newPasswordController,
                        errorMessage: "يجب ادخال الرقم السري",
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                      ),
                      TextFieldWidget(
                        controller: cubit.newConfirmPasswordController,
                        errorMessage: "يجب ادخال تأكيد الرقم السري",
                        //titleStyle: AppStyles.styleRegular12(context),
                        hintText: "  تأكيد الرقم السري ",
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 15),
                      AddLogo(
                        onTap: (file) {
                          imageFile = file;
                          cubit.update();
                        },
                        imageFile: imageFile,
                      ),
                      const SizedBox(height: 40),
                      ButtonWidget(
                        height: size.height * 0.06,
                        width: size.width * 0.5,
                        hasElevation: true,
                        text: 'اتمام التسحيل',
                        onPressed: () {
                          if (cubit.formKey2.currentState!.validate()) {
                            Workshop workshop = Workshop(
                                phone,
                                password,
                                cubit.workshopNameController.text,
                                cubit.branchNameController.text,
                                cubit.addressController.text,
                                cubit.ownerNameController.text,
                                cubit.phoneController.text,
                                cubit.newPasswordController.text,
                                imageFile?.absolute.path ?? '');
                            EasyLoading.show();
                            cubit.register(workshop, password).then((e) {
                              uploadImage(imageFile, "logo")
                                  .whenComplete(() => EasyLoading.dismiss())
                                  .then((e) {
                                FirebaseCollection()
                                    .workshopCol
                                    .doc("profile")
                                    .update({"logoPath": e}).then((e) =>
                                        Navigator.pushNamed(context, 'login'));
                              });
                            });
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
