import 'package:bab_el_ezz/data/return_invoice.dart';
import 'package:bab_el_ezz/features/invoices/invoices/widget/top_invoice_search.dart';
import 'package:bab_el_ezz/features/invoices/supplier_invoices/manager/supplier_invoice/supplier_invoice_cubit.dart';
import 'package:bab_el_ezz/shared_utils/utils/constant.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared_utils/utils/widget/add_icon_button.dart';
import '../../../../shared_utils/utils/widget/drop_menu.dart';

class MerchantReturnedTable extends StatelessWidget {
  MerchantReturnedTable({
    super.key,
  });

  List<ReturnInvoice> invoices = [];
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => InvoiceCubit(),
      child: BlocBuilder<InvoiceCubit, InvoiceState>(
        builder: (context, state) {
          InvoiceCubit cubit = InvoiceCubit.get(context);

          if (state is SupplierInvoiceInitial) {
            cubit.getInvoices(INVOICE_MERCHANT_RETURN);
          }

          if (state is SearchData) {
            invoices = state.data.map((e) => e as ReturnInvoice).toList();
          }

          return Column(
            children: [
              TopInvoicesSearch(
                controller: controller,
                onPressedSearch: () {
                  cubit.searchInvoices(controller.text);
                },
                text: ' مرتجع التجار / الموردين',
                height: 70,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: CustomDataTable(
                    columns: [
                      DataColumn(label: AddIconButton(
                        onPressed: () async {
                          ReturnInvoice invoice = await Navigator.pushNamed(
                                  context, 'addMerchantReturnedData')
                              as ReturnInvoice;
                          print("invoice: ${invoice.toJson()}");
                          cubit.addInvoice(invoice, INVOICE_MERCHANT_RETURN);
                        },
                      )),
                      const DataColumn(label: Text('مسلسل')),
                      const DataColumn(label: Text('اسم المورد')),
                      const DataColumn(label: Text('رقم التليفون')),
                      const DataColumn(label: Text('اجمالي الفاتورة')),
                      const DataColumn(label: Text('PDF')),
                    ],
                    rows: List.generate(
                      invoices.length,
                      (index) => DataRow(
                        cells: <DataCell>[
                          DataCell(DropMenu(
                            index: index,
                            onTapEdit: (index) async {
                              ReturnInvoice invoice = await Navigator.pushNamed(
                                  context, 'addMerchantReturnedData',
                                  arguments: invoices[index]) as ReturnInvoice;
                              cubit.updateInvoice(
                                  invoice, INVOICE_MERCHANT_RETURN);
                            },
                            onTapDelete: (index) {
                              cubit.deleteInvoice(
                                  invoices[index], INVOICE_MERCHANT_RETURN);
                            },
                          )),
                          DataCell(Text("${index + 1}")),
                          DataCell(Text(invoices[index].clientName)),
                          DataCell(Text(invoices[index].phoneNumber)),
                          DataCell(Text(invoices[index].price.toString())),
                          DataCell(Text('dfdd')),
                        ],
                      ),
                    )),
              ),
            ],
          );
        },
      ),
    );
  }
}
