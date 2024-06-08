import 'package:bab_el_ezz/shared_utils/utils/widget/const_appbar.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared_utils/styles/text.dart';
import '../../../../shared_utils/utils/widget/button_widget.dart';
import '../../../new_job-order/widgets/gray_container.dart';
import '../manager/spare_invoices/spare_invoices_cubit.dart';
import 'add_invoice_spare_row_table.dart';
import 'add_invoice_spare_table.dart';

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
                appBar: constAppBar(
                  context,
                  ' اضافة فاتورة جديدة',
                ),
                body: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        height: size.height,
                        child: Form(
                          key: cubit.formKey1,
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              GrayContainer(
                                height: size.height * 0.33,

                                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextFieldWidget(
                                      height: size.height * 0.06,
                                      controller: cubit.nameController,
                                      label: ' اسم العميل :',
                                      hintText: 'الاسم',
                                      hintStyle: AppStyles.styleRegular10(context),
                                      style: AppStyles.styleRegular10(context),
                                      borderRadius: 4,
                                      onChanged: (value) {},
                                      keyboardType: TextInputType.text,



                                    ),
                                    TextFieldWidget(
                                      height: size.height * 0.06,
                                      controller: cubit.phoneController,
                                      label: 'رقم التلفون :',
                                      hintText: 'الموجود عليه الواتساب',
                                      hintStyle: AppStyles.styleRegular10(context),
                                      style: AppStyles.styleRegular10(context),

                                      borderRadius: 4,
                                      onChanged: (value) {},
                                      keyboardType: TextInputType.number,

                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, 'AddCustomerInSpareInvoice');

                                      },
                                      child: Text('اضافه عميل',style: AppStyles.styleRegular14(context).copyWith(color: Colors.white),),
                                    ),



                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: AddInvoiceSpareTable(
                                    rows: cubit.items,
                                    onPressed:(){

                                      cubit.addItem(addInvoiceSpareRowTable(context));

                                    }
                                ),
                              ),



                              const SizedBox(height: 20),
                              Spacer(
                                flex: 3,
                              ),
                              ButtonWidget(
                                hasElevation: true,
                                height: size.height * 0.05,
                                text: ' إضافة  ',
                                onPressed: () {

                                },
                              ),
                              Spacer(
                              )
                            ],
                          ),
                        ),
                      )),
                ),
              );
    }),
    );
  }
}
