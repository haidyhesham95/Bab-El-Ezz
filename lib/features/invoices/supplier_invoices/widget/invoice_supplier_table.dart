import 'package:bab_el_ezz/data/merchant_invoice.dart';
import 'package:bab_el_ezz/features/invoices/invoices/widget/top_invoice_search.dart';
import 'package:bab_el_ezz/features/invoices/supplier_invoices/manager/supplier_invoice/supplier_invoice_cubit.dart';
import 'package:bab_el_ezz/shared_utils/utils/constant.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/show_details_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../shared_utils/utils/widget/add_icon_button.dart';
import '../../../../shared_utils/utils/widget/drop_menu.dart';

class InvoicesSuppliersTable extends StatelessWidget {
  InvoicesSuppliersTable({super.key});
  TextEditingController invoiceController = TextEditingController();
  List<MerchantInvoice> invoices = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => InvoiceCubit(),
      child: BlocBuilder<InvoiceCubit, InvoiceState>(
        builder: (context, state) {
          InvoiceCubit cubit = InvoiceCubit.get(context);

          if (state is SupplierInvoiceInitial) {
            cubit.getInvoices(INVOICE_MERCHANT);
            return CircularProgressIndicator();
          }

          if (state is SearchData) {
            invoices = state.data.map((e) => e as MerchantInvoice).toList();
          }

          return Column(
            children: [
              TopInvoicesSearch(
                controller: invoiceController,
                onPressedSearch: () {
                  cubit.searchInvoices(invoiceController.text);
                },
              ),
              showDetailsText(
                  context: context,
                  onPressed: () {
                    cubit.updateShowAll();
                  },
                  showAll: cubit.showAll),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: CustomDataTable(
                  columns: [
                    DataColumn(label: AddIconButton(
                      onPressed: () async {
                        MerchantInvoice invoice =
                            await Navigator.pushNamed(context, 'addInvoiceData')
                                as MerchantInvoice;
                        cubit.addInvoice(invoice, INVOICE_MERCHANT);
                      },
                    )),
                    if (cubit.showAll) ...[
                      const DataColumn(label: Text('مسلسل')),
                    ],
                    const DataColumn(label: Text('اسم المورد')),
                    const DataColumn(label: Text('التاريخ')),
                    const DataColumn(label: Text('رقم الفاتورة')),
                    if (cubit.showAll) ...[
                      const DataColumn(label: Text('اجمالي الفاتورة')),
                      const DataColumn(label: Text('المدفوع')),
                      const DataColumn(label: Text('الاجل')),
                      const DataColumn(label: Text(' تاريخ الاستحقاق ')),
                    ],
                    const DataColumn(label: Text('صورة الفاتورة')),
                  ],
                  rows: List.generate(
                    invoices.length,
                    (index) => DataRow(
                      cells: <DataCell>[
                        DataCell(DropMenu(
                          onTapEdit: (index) async {
                            MerchantInvoice invoice = await Navigator.pushNamed(
                                context, 'addInvoiceData',
                                arguments: invoices[index]) as MerchantInvoice;
                            print("invoice: ${invoice.invoiceNumber}");
                            cubit.updateInvoice(invoice, INVOICE_MERCHANT);
                          },
                          onTapDelete: (index) {
                            cubit.deleteInvoice(
                                invoices[index], INVOICE_MERCHANT);
                          },
                          index: index,
                        )),
                        if (cubit.showAll) ...[
                          DataCell(Text("${index + 1}")),
                        ],
                        DataCell(Text(invoices[index].clientName)),
                        DataCell(Text(DateFormat("dd/MM/yyyy")
                            .format(invoices[index].date))),
                        DataCell(Text(invoices[index].invoiceNumber ?? '--')),
                        if (cubit.showAll) ...[
                          DataCell(
                              Text(invoices[index].price.toString() ?? '--')),
                          DataCell(Text(
                              invoices[index].totalPaid?.toString() ?? '--')),
                          DataCell(Text(
                              invoices[index].totalRemaining?.toString() ??
                                  '--')),
                          DataCell(Text(DateFormat("dd/MM/yyyy")
                              .format(invoices[index].checkDate!))),
                        ],
                        DataCell(IconButton(
                            onPressed: () {
                              cubit.downloadAndOpenImage(invoices[index]);
                            },
                            icon: const Icon(Icons.image))),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
