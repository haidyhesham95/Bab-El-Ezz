import 'package:bab_el_ezz/data/spare_invoice.dart';
import 'package:bab_el_ezz/features/invoices/invoices/widget/top_invoice_search.dart';
import 'package:bab_el_ezz/features/invoices/supplier_invoices/manager/supplier_invoice/supplier_invoice_cubit.dart';
import 'package:bab_el_ezz/shared_utils/utils/constant.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../shared_utils/utils/widget/add_icon_button.dart';
import '../../../../shared_utils/utils/widget/drop_menu.dart';

class InvoiceSpareTable extends StatelessWidget {
  InvoiceSpareTable({
    super.key,
  });

  List<SpareInvoice> invoices = [];
  final TextEditingController queryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InvoiceCubit(),
      child: BlocBuilder<InvoiceCubit, InvoiceState>(
        builder: (context, state) {
          InvoiceCubit cubit = InvoiceCubit.get(context);

          if (state is SupplierInvoiceInitial) {
            cubit.getInvoices(INVOICE_SPARE);
          }
          if (state is SearchData) {
            invoices = state.data.map((e) => e as SpareInvoice).toList();
          }

          return Column(
            children: [
              TopInvoicesSearch(
                controller: queryController,
                onPressedSearch: () {
                  cubit.searchInvoices(queryController.text);
                },
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: CustomDataTable(
                  columns: [
                    DataColumn(label: AddIconButton(
                      onPressed: () async {
                        SpareInvoice invoice = await Navigator.pushNamed(
                            context, 'addInvoiceSpareData') as SpareInvoice;
                        cubit.addInvoice(invoice, INVOICE_SPARE);
                      },
                    )),
                    const DataColumn(label: Text('مسلسل')),
                    const DataColumn(label: Text('اسم العميل')),
                    const DataColumn(label: Text('رقم التليفون')),
                    const DataColumn(label: Text('قيمة الفاتورة')),
                    const DataColumn(label: Text('التاريخ')),
                    const DataColumn(label: Text('PDf')),
                  ],
                  rows: List.generate(
                    invoices.length,
                    (index) => DataRow(
                      cells: <DataCell>[
                        DataCell(DropMenu(
                          onTapEdit: (index) async {
                            SpareInvoice invoice = await Navigator.pushNamed(
                                context, 'addInvoiceSpareData',
                                arguments: invoices[index]) as SpareInvoice;
                            cubit.updateInvoice(invoice, INVOICE_SPARE);
                          },
                          onTapDelete: (index) {
                            cubit.deleteInvoice(invoices[index], INVOICE_SPARE);
                          },
                          index: index,
                        )),
                        DataCell(Text("${index + 1}")),
                        DataCell(Text(invoices[index].clientName)),
                        DataCell(Text(invoices[index].phoneNumber)),
                        DataCell(Text((invoices[index]).price.toString())),
                        DataCell(Text(DateFormat("yyyy-MM-dd hh:mm")
                            .format(invoices[index].date))),
                        DataCell(Text('dfddh')),
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
