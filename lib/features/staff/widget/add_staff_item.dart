import 'package:flutter/material.dart';
import '../../../shared_utils/styles/colors.dart';
import '../../../shared_utils/styles/text.dart';
import '../../../shared_utils/utils/widget/button_widget.dart';
import '../../../shared_utils/utils/widget/drop_menu.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared_utils/styles/colors.dart';
import '../../../shared_utils/styles/text.dart';
import '../../../shared_utils/utils/widget/button_widget.dart';
import '../../../shared_utils/utils/widget/const_appbar.dart';
import '../../../shared_utils/utils/widget/text_field.dart';
import '../../new_job-order/widgets/drop_button.dart';
import '../manager/daily_table/daily_table_cubit.dart';
import '../manager/staff_table/staff_table_cubit.dart';

class AddStaffItem extends StatelessWidget {
  const AddStaffItem({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return  Scaffold(
        appBar: constAppBar(context, ' اضافة '),
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
                                hintText: "  اسم الفني ",
                                controller: cubit.nameController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.name,
                              ),
                              const SizedBox(height: 15),
                              TextFieldWidget(
                                label: " الرقم القومي ",
                                hintText: " الرقم القومي ",
                                controller: cubit.numberController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                              ),
                              const SizedBox(height: 15),
                              TextFieldWidget(
                                label: " التخصص ",
                                hintText: " التخصص ",
                                controller: cubit.majorController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.name,
                              ),
                              const SizedBox(height: 15),


                              TextFieldWidget(
                                label: " الدرجة الوظيفية ",
                                hintText: " الدرجة الوظيفية ",
                                controller: cubit.degreeController,

                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                              ),

                              SizedBox(height: 15),
                              TextFieldWidget(
                                label: " القيمة اليومية ",
                                hintText: " القيمة اليومية ",
                                controller: cubit.valueController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.name,
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