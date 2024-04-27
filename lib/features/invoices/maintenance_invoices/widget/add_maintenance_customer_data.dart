
import 'package:bab_el_ezz/shared_utils/utils/widget/button_widget.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/const_appbar.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/maintenance_invoice/maintenance_invoice_cubit.dart';

class AddMaintenanceCustomerData extends StatelessWidget {
  const AddMaintenanceCustomerData({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: constAppBar(context,' اضافة عميل'),
      body: SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: BlocProvider(
              create: (context) => MaintenanceInvoiceCubit(),
              child: BlocConsumer<MaintenanceInvoiceCubit, MaintenanceInvoiceState>(
                listener: (context, state) {},
                builder: (context, state) {
                  MaintenanceInvoiceCubit cubit = MaintenanceInvoiceCubit.get(context);
                  return Form(
                    key:cubit.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(height: 20),
                        TextFieldWidget(
                          label: " الاسم ",
                          hintText: "  الاسم ",
                          controller: cubit.nameController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                        ),

                        const SizedBox(height: 15,),
                        TextFieldWidget(
                          label: " رقم التلفون ",
                          hintText: " رقم التلفون ",
                          controller: cubit.phoneNumberController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                        ),

                        const SizedBox(height: 15,),

                        TextFieldWidget(
                          label: " ماركه السياره",
                          hintText: " ماركه السياره ",
                          controller: cubit.cartModelController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                        ),
                        const SizedBox(height: 15,),
                        TextFieldWidget(
                          label: " الموديل ",
                          hintText: " الموديل ",
                          controller: cubit.modelController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                        ),
                        const SizedBox(height: 15,),
                        TextFieldWidget(
                          label: " سنة الصنع ",
                          hintText: " سنة الصنع ",
                          controller: cubit.yearController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 15,),
                        TextFieldWidget(
                          label: " رقم اللوحه ",
                          hintText: " رقم اللوحه ",
                          controller: cubit.cartNumberController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 15,),
                        TextFieldWidget(
                          label: " رقم الشاسيه ",
                          hintText: " رقم الشاسيه ",
                          controller: cubit.screenNumberController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 15,),
                        TextFieldWidget(
                          label: " رقم الماتور ",
                          hintText: " رقم الماتور ",
                          controller: cubit.matorNumberController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 15,),
                        TextFieldWidget(
                          label: " نوع ناقل الحركة ",
                          hintText: " نوع ناقل الحركة ",
                          controller: cubit.typeController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                        ),

                        const SizedBox(height: 50,),
                        ButtonWidget(
                          hasElevation: true,
                          height: size.height * 0.05,
                          text: 'اضافة عميل',
                          onPressed: () {
                            if (cubit.formKey.currentState!.validate()) {
                              Navigator.pop(context);
                            }

                          },

                        ),
                        const SizedBox(height: 20,),

                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
    );
  }
}