import 'package:bab_el_ezz/data/return_part.dart';
import 'package:bab_el_ezz/features/invoices/invoices/widget/top_invoice_search.dart';
import 'package:bab_el_ezz/features/invoices/supplier_invoices/manager/supplier_invoice/supplier_invoice_cubit.dart';
import 'package:bab_el_ezz/shared_utils/utils/constant.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared_utils/utils/widget/add_icon_button.dart';
import '../../../../shared_utils/utils/widget/drop_menu.dart';

class CustomerReturnedTable extends StatelessWidget {
  CustomerReturnedTable({
    super.key,
  });

  List<ReturnPart> invoices = [];
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
            cubit.getInvoices(INVOICE_RETURN);
          }
          if (state is SearchData) {
            invoices = state.data.map((e) => e as ReturnPart).toList();
          }

          return Column(
            children: [
              TopInvoicesSearch(
                controller: controller,
                text: ' مرتجع العملاء',
                onPressedSearch: () {
                  cubit.searchInvoices(controller.text);
                },
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: CustomDataTable(
                    columns: [
                      DataColumn(label: AddIconButton(
                        onPressed: () async {
                          ReturnPart invoice = await Navigator.pushNamed(
                              context, 'addCustomerReturnedData') as ReturnPart;

                          cubit.addInvoice(invoice, INVOICE_RETURN);
                        },
                      )),
                      const DataColumn(label: Text('مسلسل')),
                      const DataColumn(label: Text('الصنف')),
                      const DataColumn(label: Text('الكمية')),
                      const DataColumn(label: Text('السعر')),
                      const DataColumn(label: Text('الحالة')),
                      const DataColumn(label: Text('الملاحظات')),
                    ],
                    rows: List.generate(
                      invoices.length,
                      (index) => DataRow(
                        cells: <DataCell>[
                          DataCell(DropMenu(
                            index: index,
                            onTapEdit: (index) async {
                              ReturnPart invoice = await Navigator.pushNamed(
                                  context, 'addCustomerReturnedData',
                                  arguments: invoices[index]) as ReturnPart;
                              print("invoice: ${invoice.invoiceNumber}");
                              cubit.updateInvoice(invoice, INVOICE_RETURN);
                            },
                            onTapDelete: (index) {
                              cubit.deleteInvoice(
                                  invoices[index], INVOICE_RETURN);
                            },
                          )),
                          DataCell(Text("${index + 1}")),
                          DataCell(Text(invoices[index].name)),
                          DataCell(Text(invoices[index].quantity.toString())),
                          DataCell(Text(invoices[index].price.toString())),
                          DataCell(Text(invoices[index].status)),
                          DataCell(Text(invoices[index].notes)),
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
