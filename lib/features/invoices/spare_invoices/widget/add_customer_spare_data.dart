import 'package:bab_el_ezz/data/customer.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/const_appbar.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/text_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared_utils/utils/widget/button_widget.dart';
import '../manager/spare_invoices/spare_invoices_cubit.dart';

class AddCustomerSpareData extends StatelessWidget {
  AddCustomerSpareData({super.key});

  bool isUpdate = false;
  Customer? customer;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (context) => SpareInvoicesCubit(),
        child: BlocConsumer<SpareInvoicesCubit, SpareInvoicesState>(
            listener: (context, state) {},
            builder: (context, state) {
              SpareInvoicesCubit cubit = SpareInvoicesCubit.get(context);

              if (state is SpareInvoicesInitial) {
                customer =
                    ModalRoute.of(context)?.settings.arguments as Customer?;
                if (customer != null && !isUpdate) {
                  isUpdate = true;
                  cubit.customerNameController.text = customer!.name;
                  cubit.customerPhoneController.text = customer!.phoneNumber;
                }
              }
              return Scaffold(
                appBar: constAppBar(
                  context,
                  ' اضافة عميل',
                ),
                body: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Form(
                        key: cubit.formKey,
                        child: SizedBox(
                          height: size.height,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(height: 20),
                              TextFieldWidget(
                                label: " الاسم : ",
                                hintText: " ادخال الاسم ",
                                controller: cubit.customerNameController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.name,
                                errorMessage:
                                    '(الاسم يجب ان يحتوي علي 3 خانات)',
                              ),
                              const SizedBox(height: 20),
                              TextFieldWidget(
                                label: " رقم التلفون : ",
                                hintText: " +20 ",
                                controller: cubit.customerPhoneController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                errorMessage:
                                    '(رقم الهاتف يجب ان يحتوي علي 11 خانات)',
                              ),
                              const Spacer(
                                flex: 3,
                              ),
                              ButtonWidget(
                                hasElevation: true,
                                height: size.height * 0.05,
                                text: ' إضافة  ',
                                onPressed: () {
                                  if (kDebugMode ||
                                      cubit.formKey.currentState!.validate()) {
                                    Customer customer = Customer(
                                        cubit.customerNameController.text,
                                        cubit.customerPhoneController.text,
                                        null);
                                    Navigator.pop(context, customer);
                                  }
                                },
                              ),
                              const Spacer()
                            ],
                          ),
                        ),
                      )),
                ),
              );
            }));
  }
}
