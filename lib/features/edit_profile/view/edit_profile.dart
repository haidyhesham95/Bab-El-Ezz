import 'package:bab_el_ezz/features/auth/widget/location.dart';
import 'package:bab_el_ezz/features/edit_profile/edit_profile_cubit.dart';
import 'package:bab_el_ezz/shared_utils/styles/colors.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/button_widget.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/const_appbar.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../generated/assets.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: constAppBar(context,  'تعديل البيانات'),
        body: SingleChildScrollView(
          child: BlocProvider(
            create: (context) => EditProfileCubit(),

            child: BlocConsumer<EditProfileCubit, EditProfileState>(
                listener: (context, state) {},
                builder: (context, state) {
                  EditProfileCubit cubit = EditProfileCubit.get(context);
                  return Form(
                    key: cubit.formKey,
                    child: Stack(
                        children:[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15,),
                            child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20,),
                              Image.asset(Assets.imagesCarservices),

                              const SizedBox(height: 15),
                              TextFieldWidget(
                                label: " اسم المركز ",
                                hintText: "الاسم ....",
                                controller: cubit.centerNameController,
                                errorMessage: "يجب ادخال اسم المركز",
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                              ),
                              const SizedBox(height: 15),
                              TextFieldWidget(
                                label: " اسم صاحب المركز ",
                                hintText: "الاسم ....",
                                controller: cubit.ownerCenterNameController,
                                errorMessage: "يجب ادخال اسم صاحب المركز",
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                              ),
                              const SizedBox(height: 10),
                              TextFieldWidget(
                                label: " اسم الفرع  ",
                                hintText: "اسم ...",
                                controller: cubit.branchNameController,
                                errorMessage: "يجب ادخال اسم الفرع",
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                              ),
                              const SizedBox(height: 10),
                              TextFieldWidget(
                                controller: cubit.addressController,
                                errorMessage: "يجب ادخال العنوان",
                                label: "العنوان",
                                hintText: ".... العنوان",
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                              ),

                              const SizedBox(height: 10),
                               TextFieldWidget(
                                label: " رقم الهاتف  ",
                                hintText: " +20 ",
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                errorMessage: "يجب ادخال رقم الهاتف",
                                controller: cubit.phoneController,
                              ),
                              const SizedBox(height: 10),
                              TextFieldWidget(
                                label: " الرقم السري القديم  ",
                                hintText: "ادخال الرقم السري القديم ",
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.visiblePassword,
                                errorMessage: "يجب ادخال الرقم السري القديم",
                                controller: cubit.oldPasswordController,
                                obscureText: true,
                              ),
                              const SizedBox(height: 10),
                              TextFieldWidget(
                                label: " الرقم السري الجديد  ",
                                hintText: " ادخال الرقم السري الجديد ",
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.visiblePassword,
                                errorMessage: "يجب ادخال الرقم السري الجديد",
                                controller: cubit.newPasswordController,
                                obscureText: true,
                              ),
                              const SizedBox(height: 20),
                              const Location(),
                              const SizedBox(height: 50),

                              ButtonWidget(

                                hasElevation: true,
                                text: 'حفظ',
                                onPressed: () {
                                  if (cubit.formKey.currentState!.validate()) {
                                    Navigator.pushNamed(context, 'login');

                                  }
                                },
                              ),
                              const SizedBox(height: 20),

                            ]),
                          ),
                          Positioned(
                            right: 7,
                            top: 10,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: ColorsAsset.kGreen,
                              child: Center(
                                child: SvgPicture.asset(
                                  Assets.imagesEditIcon,
                                  height: 15,width: 15,
                                ),
                              ),
                            ),
                          ),

                        ]),
                  );
                }),
          ),
        ));
  }
}
