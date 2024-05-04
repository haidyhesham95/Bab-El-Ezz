import 'package:flutter/material.dart';
import '../../../shared_utils/utils/widget/button_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared_utils/utils/widget/const_appbar.dart';
import '../../../shared_utils/utils/widget/text_field.dart';

import '../manager/staff_table/staff_table_cubit.dart';

class AddStaffItem extends StatelessWidget {
  const AddStaffItem({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return  Scaffold(
        appBar: constAppBar(context, ' اضافة عامل'),
        body: BlocProvider(
            create: (context) => StaffTableCubit(),
            child: BlocBuilder<StaffTableCubit, StaffTableState>(
                builder: (context, state) {
                  StaffTableCubit cubit = StaffTableCubit.get(context);
                  return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Form(
                          key: cubit.formKey,
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              TextFieldWidget(
                                label: " اسم الفني ",
                                hintText: "  اضافه اسم الفني ",
                                controller: cubit.nameController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.name,
                                errorMessage: 'الرجاء ادخال الاسم',

                              ),
                              const SizedBox(height: 15),
                              TextFieldWidget(
                                label: " الرقم القومي ",
                                hintText: "  ادخال الرقم القومي ",
                                controller: cubit.numberController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                errorMessage: 'الرجاء ادخال الرقم القومي',
                              ),
                              const SizedBox(height: 15),
                              TextFieldWidget(
                                label: " التخصص ",
                                hintText: "اضافه التخصص ",
                                controller: cubit.majorController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.name,
                                errorMessage: 'الرجاء ادخال التخصص',
                              ),
                              const SizedBox(height: 15),


                              TextFieldWidget(
                                label: " الدرجة الوظيفية ",
                                hintText: "  ادخال الدرجة الوظيفية ",
                                controller: cubit.degreeController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.name,
                                errorMessage: 'الرجاء ادخال الدرجة الوظيفية',
                              ),

                              const SizedBox(height: 15),
                              TextFieldWidget(
                                label: " القيمة اليومية ",
                                hintText: "  ادخال القيمة اليومية ",
                                controller: cubit.valueController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.name,
                                errorMessage: 'الرجاء ادخال القيمة اليومية',
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              ButtonWidget(
                                hasElevation: true,
                                height: size.height * 0.05,
                                // width: size.width * 0.7,
                                text: ' اضافة ',
                                onPressed: () {
                                  if (cubit.formKey.currentState!.validate()) {
                                    Navigator.pop(context);
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ));
                })));
  }
}