import 'package:bab_el_ezz/data/technician.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared_utils/utils/widget/button_widget.dart';
import '../../../shared_utils/utils/widget/const_appbar.dart';
import '../../../shared_utils/utils/widget/text_field.dart';
import '../manager/staff_table/staff_table_cubit.dart';

class AddStaffItem extends StatelessWidget {
  AddStaffItem({super.key});

  Technician? technician;
  bool isUpdate = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: constAppBar(context, ' اضافة عامل'),
        body: BlocProvider(
            create: (context) => StaffTableCubit(),
            child: BlocBuilder<StaffTableCubit, StaffTableState>(
                builder: (context, state) {
              StaffTableCubit cubit = StaffTableCubit.get(context);

              if (state is StaffTableInitial && technician == null) {
                var data = ModalRoute.of(context)?.settings.arguments;
                print("data: $data");
                if (data != null) {
                  technician =
                      Technician.fromJson(data as Map<String, dynamic>);
                  isUpdate = true;
                  cubit.nameController.text = technician?.name ?? '';
                  cubit.dailyRateController.text =
                      technician?.dailyRate.toString() ?? '';
                  cubit.nationalIdController.text =
                      technician?.nationalId ?? '';
                  cubit.titleController.text = technician?.title ?? '';
                  cubit.specializationController.text =
                      technician?.specialization ?? '';
                }
              }
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
                        controller: cubit.nationalIdController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        errorMessage: 'الرجاء ادخال الرقم القومي',
                      ),
                      const SizedBox(height: 15),
                      TextFieldWidget(
                        label: " التخصص ",
                        hintText: "اضافه التخصص ",
                        controller: cubit.specializationController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        errorMessage: 'الرجاء ادخال التخصص',
                      ),
                      const SizedBox(height: 15),
                      TextFieldWidget(
                        label: " الدرجة الوظيفية ",
                        hintText: "  ادخال الدرجة الوظيفية ",
                        controller: cubit.titleController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        errorMessage: 'الرجاء ادخال الدرجة الوظيفية',
                      ),
                      const SizedBox(height: 15),
                      TextFieldWidget(
                        label: " القيمة اليومية ",
                        hintText: "  ادخال القيمة اليومية ",
                        controller: cubit.dailyRateController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
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
                            Technician technician = Technician(
                              this.technician?.id,
                              cubit.nameController.text,
                              cubit.nationalIdController.text,
                              cubit.specializationController.text,
                              cubit.titleController.text,
                              double.parse(cubit.dailyRateController.text),
                            );
                            print("isUpdated: $isUpdate");
                            isUpdate
                                ? cubit.updateTechnician(technician).then(
                                    (value) =>
                                        Navigator.pop(context, technician))
                                : cubit
                                    .addTechnician(
                                        technician..created = DateTime.now())
                                    .then((value) =>
                                        Navigator.pop(context, technician));
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
