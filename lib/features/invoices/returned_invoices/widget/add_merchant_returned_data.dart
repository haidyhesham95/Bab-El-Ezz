import 'package:bab_el_ezz/data/return_invoice.dart';
import 'package:bab_el_ezz/data/return_part.dart';
import 'package:bab_el_ezz/shared_utils/styles/colors.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/button_widget.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/const_appbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared_utils/styles/text.dart';
import '../../../new_job-order/widgets/drop_button.dart';
import '../manager/returned_invoices_cubit.dart';

class AddMerchantReturnedData extends StatefulWidget {
  const AddMerchantReturnedData({super.key});

  @override
  State<AddMerchantReturnedData> createState() =>
      _AddMerchantReturnedDataState();
}

class _AddMerchantReturnedDataState extends State<AddMerchantReturnedData> {
  List<Widget> items = [];
  bool isUpdate = false;
  ReturnInvoice? invoice;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: constAppBar(context, 'إضافة فاتورة'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: BlocProvider(
            create: (context) => ReturnedInvoicesCubit(),
            child: BlocConsumer<ReturnedInvoicesCubit, ReturnedInvoicesState>(
              listener: (context, state) {},
              builder: (context, state) {
                ReturnedInvoicesCubit cubit =
                    ReturnedInvoicesCubit.get(context);

                if (state is ReturnedInvoicesInitial) {
                  cubit.getMerchants();
                  invoice = ModalRoute.of(context)?.settings.arguments
                      as ReturnInvoice?;

                  return const CircularProgressIndicator();
                }

                print("invoice: ${invoice?.clientName}");
                if (invoice != null && !isUpdate) {
                  isUpdate = true;
                  cubit.selectedMerchant = cubit.merchants
                      .where((element) => element.name == invoice!.clientName)
                      .first;
                  cubit.selectedCompanyName = invoice!.company;
                  print("invoice parts: ${invoice!.parts.map((e) => e.name)}");
                  invoice?.parts.forEach((element) {
                    cubit.addWidget(data: [
                      element.name,
                      (element.quantity ?? '').toString(),
                      (element.price ?? '').toString(),
                      element.notes,
                      element.status
                    ]);
                  });
                }

                return Form(
                  key: cubit.formKey1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      DropButton(
                        hintText: ' اسم التاجر أو المورد ',
                        value: cubit.selectedMerchant?.name,
                        onChanged: (String? value) {
                          cubit.selectedMerchant = cubit.merchants
                              .where((element) => element.name == value)
                              .first;
                          cubit.update();
                          // cubit.setSelectedMerchantName(value);
                        },
                        items: List.generate(
                            cubit.merchants.length,
                            (index) => DropdownMenuItem(
                                  value: cubit.merchants[index].name,
                                  child: Text(cubit.merchants[index].name),
                                )),
                      ),
                      const SizedBox(height: 20),
                      DropButton(
                        hintText: ' اسم الشركة',
                        value: cubit.selectedCompanyName,
                        onChanged: (String? value) {
                          cubit.selectedCompanyName = value;
                          cubit.update();
                        },
                        items: List.generate(
                            cubit.merchants.length,
                            (index) => DropdownMenuItem(
                                  value: cubit.merchants[index].company,
                                  child: Text(cubit.merchants[index].company),
                                )),
                      ),
                      const SizedBox(height: 15),
                      const Divider(
                        color: ColorsAsset.kBrown,
                      ),
                      ...cubit.partWidgets,
                      ElevatedButton(
                        onPressed: () {
                          cubit.addWidget();
                        },
                        child: Text(
                          'اضافه صنف اخر',
                          style: AppStyles.styleRegular14(context)
                              .copyWith(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      ButtonWidget(
                        hasElevation: true,
                        height: size.height * 0.05,
                        text: 'إضافة ',
                        onPressed: () {
                          if (kDebugMode ||
                              cubit.formKey1.currentState!.validate()) {
                            ReturnInvoice invoice = ReturnInvoice(
                                phoneNumber:
                                    cubit.selectedMerchant?.phone ?? '',
                                clientName: cubit.selectedMerchant?.name ?? '',
                                company: cubit.selectedCompanyName ?? '',
                                price: cubit.controllers.indexed.fold(
                                    0,
                                    (previousValue, element) =>
                                        previousValue +
                                        (int.parse(element.$2[1].text) *
                                            double.parse(element.$2[2].text))),
                                parts: cubit.controllers.indexed.map((e) {
                                  return ReturnPart(
                                    name: e.$2[0].text,
                                    quantity: int.parse(e.$2[1].text),
                                    price: double.parse(e.$2[2].text),
                                    notes: e.$2[3].text,
                                    status: cubit.statuses[e.$1],
                                  );
                                }).toList())
                              ..invoiceNumber =
                                  this.invoice?.invoiceNumber ?? '';
                            Navigator.of(context).pop(invoice);
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
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
