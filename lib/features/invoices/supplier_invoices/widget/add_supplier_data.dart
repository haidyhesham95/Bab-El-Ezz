import 'package:bab_el_ezz/shared_utils/utils/widget/const_appbar.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared_utils/utils/widget/button_widget.dart';

import '../manager/supplier_invoice/supplier_invoice_cubit.dart';

class AddSuppliersData extends StatelessWidget {
  const AddSuppliersData({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (context) => SupplierInvoiceCubit(),
        child: BlocConsumer<SupplierInvoiceCubit, SupplierInvoiceState>(
            listener: (context, state) {},
            builder: (context, state) {
              SupplierInvoiceCubit cubit = SupplierInvoiceCubit.get(context);
              return Scaffold(
                appBar: constAppBar(context, '  إضافة تاجر/مورد ', ),
                body: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Form(
                        key: cubit.formKey1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            const SizedBox(height: 20),
                            TextFieldWidget(
                              label: " اسم المورد ",
                              hintText: "  الاسم ",
                              controller: cubit.nameController,
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
                              label: " اسم الشركة ",
                              hintText: " ادخل اسم الشركة ",
                              controller: cubit.companyNameController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              errorMessage: '(الاسم يجب ان يحتوي علي 3 احرف علي الاقل)',
                            ),
                            const SizedBox(height: 15,),

                            TextFieldWidget(
                              label: " عدد الفواتير ",
                              hintText: " ادخل عدد الفواتير",
                              controller: cubit.invoiceNumberController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              errorMessage: '(عدد الفواتير يجب ان يكون اكبر من 0)',
                            ),


                            const SizedBox(height: 50,),
                            ButtonWidget(
                              hasElevation: true,
                              height: size.height * 0.05,
                              text: ' إضافة تاجر/مورد ',
                              onPressed: () {
                                if (cubit.formKey1.currentState!.validate()) {
                                  Navigator.pop(context);
                                }

                              },

                            ),
                            const SizedBox(height: 20,),

                          ],
                        ),
                      )),
                ),
              );
            }));
  }
}