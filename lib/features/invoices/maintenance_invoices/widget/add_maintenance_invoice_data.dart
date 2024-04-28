
import 'package:bab_el_ezz/shared_utils/utils/widget/button_widget.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/const_appbar.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../invoices/widget/add_image.dart';

import '../manager/maintenance_invoice/maintenance_invoice_cubit.dart';

class AddMaintenanceInvoiceData extends StatelessWidget {
  const AddMaintenanceInvoiceData({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: constAppBar(context,' اضافة فاتوره صيانه'),
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
                  key:cubit.formKey1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(height: 20),
                      addImage(context, ),
                      const SizedBox(height: 20),
                      TextFieldWidget(
                        label: " اسم العميل ",
                        hintText: "  الاسم ",
                        controller: cubit.clientNameController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        errorMessage: '(الاسم يجب ان يحتوي علي 3 احرف علي الاقل)',

                      ),

                      const SizedBox(height: 15,),
                      TextFieldWidget(
                        label: " رقم التلفون ",
                        hintText: " +20 ",
                        controller: cubit.phoneController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        errorMessage: '(رقم الهاتف يجب ان يحتوي علي 11 خانات)',
                      ),

                      const SizedBox(height: 15,),

                      TextFieldWidget(
                        label: " ماركه السياره",
                        hintText: " اضافه ماركه السياره ",
                        controller: cubit.cartModelController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        errorMessage: '(الاسم يجب ان يحتوي علي 3 احرف علي الاقل)',
                      ),
                      const SizedBox(height: 15,),

                      TextFieldWidget(
                        label: " رقم اللوحه ",
                        hintText: " اضافه رقم اللوحه ",
                        controller: cubit.cartNumberController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        errorMessage: '(رقم اللوحه يجب ان يحتوي علي 6 خانات)',
                      ),
                      const SizedBox(height: 15,),
                      TextFieldWidget(
                        label: " رقم الفاتورة  ",
                        hintText: " اضافه رقم الفاتورة",
                        controller: cubit.screenNumberController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        errorMessage: '(رقم الفاتورة يجب ان يحتوي علي 6 خانات)',
                      ),


                      const SizedBox(height: 50,),
                      ButtonWidget(
                        hasElevation: true,
                        height: size.height * 0.05,
                        text: 'اضافة فاتورة',
                        onPressed: () {
                          if (cubit.formKey1.currentState!.validate()) {
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