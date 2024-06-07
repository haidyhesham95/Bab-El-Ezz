import 'package:bab_el_ezz/shared_utils/utils/widget/const_appbar.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../shared_utils/styles/colors.dart';
import '../../../../shared_utils/styles/text.dart';
import '../../../../shared_utils/utils/widget/button_widget.dart';
import '../../../new_job-order/widgets/drop_button.dart';
import '../../invoices/widget/add_image.dart';
import '../manager/supplier_invoice/supplier_invoice_cubit.dart';

class AddInvoicesData extends StatelessWidget {
  const AddInvoicesData({super.key});

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
                appBar: constAppBar(
                  context,
                  ' اضافة فاتوره',
                ),
                body: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Form(
                      key: cubit.formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(height: 20),
                            addImage(
                              context,
                            ),
                            const SizedBox(height: 20),
                            DropButton(
                              styleHint: AppStyles.styleRegular14(context)
                                  .copyWith(color: ColorsAsset.kDarkBrown),
                              hintText: 'اسم المورد',
                              value: cubit.merchants.isNotEmpty
                                  ? cubit.merchants[0].name
                                  : "اسم المورد",
                              onChanged: (String? value) {
                                cubit.setSelectedSupplierType(value);
                              },
                              items: List.generate(
                                  cubit.merchants.length,
                                      (index) => DropdownMenuItem(
                                    value: cubit.merchants[index].name,
                                    child:
                                    Text(cubit.merchants[index].name),
                                  )),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            GestureDetector(
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2101),
                                );
                                if (pickedDate != null) {
                                  cubit.dateController.text =
                                      DateFormat('yyyy-MM-dd').format(pickedDate);
                                }
                              },
                              child: AbsorbPointer(
                                child: TextFieldWidget(
                                  label: " التاريخ ",
                                  hintText: " ادخال التاريخ ",
                                  controller: cubit.dateController,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.datetime,
                                  errorMessage: 'برجاء ادخال التاريخ',
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFieldWidget(
                              label: " رقم الفاتوره ",
                              hintText: " ادخال رقم الفاتوره ",
                              controller: cubit.invoiceNumberController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              errorMessage: 'برجاء ادخال رقم الفاتوره',
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFieldWidget(
                              label: " المدفوع ",
                              hintText: " ادخال مبلغ الدفع ",
                              controller: cubit.paidController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              errorMessage: 'برجاء ادخال المبلغ',
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFieldWidget(
                              label: " الاجل ",
                              hintText: " ادخال الاجل ",
                              controller: cubit.aglController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              errorMessage: 'برجاء ادخال الاجل',
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            GestureDetector(
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2101),
                                );
                                if (pickedDate != null) {
                                  cubit.dueDateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
                                }
                              },
                              child: AbsorbPointer(
                                child: TextFieldWidget(
                                  label: " تاريخ الاستحقاق ",
                                  hintText: " ادخال تاريخ الاستحقاق ",
                                  controller: cubit.dueDateController,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.datetime,
                                  errorMessage: 'برجاء ادخال تاريخ الاستحقاق',
                                ),
                              ),
                            ),

                            const SizedBox(height: 50),
                            ButtonWidget(
                              hasElevation: true,
                              height: size.height * 0.05,
                              text: ' إضافة  ',
                              onPressed: () {
                                if (cubit.formKey.currentState!.validate()) {
                                  Navigator.pop(context);
                                }
                              },
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    )),
              );
            }));
  }
}
