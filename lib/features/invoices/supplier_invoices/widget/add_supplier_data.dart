import 'package:bab_el_ezz/data/merchant.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/const_appbar.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared_utils/utils/widget/button_widget.dart';
import '../manager/supplier_invoice/supplier_invoice_cubit.dart';

class AddSuppliersData extends StatelessWidget {
  AddSuppliersData({super.key});

  bool isUpdate = false;
  Merchant? merchant;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return BlocProvider(
        create: (context) => SupplierInvoiceCubit(),
        child: BlocConsumer<SupplierInvoiceCubit, SupplierInvoiceState>(
            listener: (context, state) {},
            builder: (context, state) {
              SupplierInvoiceCubit cubit = SupplierInvoiceCubit.get(context);

              if (state is SupplierInvoiceInitial && merchant == null) {
                var data = ModalRoute.of(context)?.settings.arguments;
                if (data != null) {
                  isUpdate = true;
                  merchant = Merchant.fromJson(data as Map<String, dynamic>);

                  cubit.nameController.text = merchant?.name ?? '';
                  cubit.phoneController.text = merchant?.phone ?? '';
                  cubit.companyNameController.text = merchant?.company ?? '';
                }
              }

              return Scaffold(
                  appBar: constAppBar(
                    context,
                    'إضافة تاجر/مورد ',
                  ),
                  body: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: size.height,
                            child: Column(
                              children: [
                                const SizedBox(height: 20),
                                TextFieldWidget(
                                  label: " اسم المورد ",
                                  hintText: "  الاسم ",
                                  controller: cubit.nameController,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.name,
                                  errorMessage:
                                      '(الاسم يجب ان يحتوي علي 3 احرف علي الاقل)',
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextFieldWidget(
                                  label: " رقم التلفون ",
                                  hintText: " +20 ",
                                  controller: cubit.phoneController,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  errorMessage:
                                      '(رقم الهاتف يجب ان يحتوي علي 11 خانات)',
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextFieldWidget(
                                  label: " اسم الشركة ",
                                  hintText: " ادخل اسم الشركة ",
                                  controller: cubit.companyNameController,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.name,
                                  errorMessage:
                                      '(الاسم يجب ان يحتوي علي 3 احرف علي الاقل)',
                                ),
                                Spacer(
                                  flex: 3,
                                ),
                                ButtonWidget(
                                  hasElevation: true,
                                  height: size.height * 0.05,
                                  text: ' إضافة  ',
                                  onPressed: () {
                                    if (cubit.formKey1.currentState!
                                        .validate()) {
                                      Merchant merchant = Merchant(
                                          name: cubit.nameController.text,
                                          phone: cubit.phoneController.text,
                                          company:
                                              cubit.companyNameController.text);

                                      cubit.updateMerchants(merchant).then(
                                          (value) =>
                                              Navigator.pop(context, merchant));
                                    }
                                  },
                                ),
                                Spacer(
                                  flex: 2,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ButtonWidget(
                            hasElevation: true,
                            height: size.height * 0.05,
                            text: ' إضافة  ',
                            onPressed: () {
                              if (cubit.formKey1.currentState!.validate()) {
                                Merchant merchant = Merchant(
                                    id: this.merchant?.id,
                                    name: cubit.nameController.text,
                                    phone: cubit.phoneController.text,
                                    company: cubit.companyNameController.text);

                                Navigator.pop(context, merchant);
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
            }));
  }
}
