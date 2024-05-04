import 'package:bab_el_ezz/shared_utils/utils/widget/const_appbar.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared_utils/utils/widget/button_widget.dart';
import '../../invoices/widget/add_image.dart';
import '../manager/spare_invoices/spare_invoices_cubit.dart';

class AddInvoiceSpareData extends StatelessWidget {
  const AddInvoiceSpareData({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (context) => SpareInvoicesCubit(),
        child: BlocConsumer<SpareInvoicesCubit, SpareInvoicesState>(
            listener: (context, state) {},
            builder: (context, state) {
              SpareInvoicesCubit cubit = SpareInvoicesCubit.get(context);
              return Scaffold(
                appBar: constAppBar(context, ' اضافة فاتورة جديدة', ),
                body: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Form(
                      key: cubit.formKey1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(height: 20),
                          addImage(context,),
                          const SizedBox(height: 20),


                          TextFieldWidget(
                            label: " اسم العميل  : ",
                            hintText: " ادخال الاسم  ",
                            controller: cubit.nameController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                            errorMessage: '(الاسم يجب ان يحتوي علي 3 خانات)',
                          ),
                          const SizedBox(height: 20),

                          TextFieldWidget(
                            label: " رقم التلفون : ",
                            hintText: " +20 ",
                            controller: cubit.customerPhoneController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            errorMessage: '(رقم الهاتف يجب ان يحتوي علي 11 خانات)',
                          ),
                             const SizedBox(height: 20),
                          TextFieldWidget(
                            label: " رقم الفاتورة : ",
                            hintText: " ادخال رقم الفاتورة ",
                            controller: cubit.nameController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            errorMessage: '(رقم الفاتورة يجب ان يحتوي علي 3 خانات)',
                          ),
                          const SizedBox(height: 20),

                          ButtonWidget(
                            hasElevation: true,
                            height: size.height * 0.05,
                            text: ' إضافة  ',
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
              );
            }));
  }
}