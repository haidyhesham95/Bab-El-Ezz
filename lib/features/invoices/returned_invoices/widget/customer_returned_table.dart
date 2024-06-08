import 'package:bab_el_ezz/data/return_invoice.dart';
import 'package:bab_el_ezz/features/invoices/invoices/widget/top_invoice_search.dart';
import 'package:bab_el_ezz/features/invoices/supplier_invoices/manager/supplier_invoice/supplier_invoice_cubit.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared_utils/utils/widget/add_icon_button.dart';
import '../../../../shared_utils/utils/widget/drop_menu.dart';

class CustomerReturnedTable extends StatelessWidget {
  CustomerReturnedTable({
    super.key,
  });

  List<ReturnInvoice> invoices = [];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => SupplierInvoiceCubit(),
      child: BlocBuilder<SupplierInvoiceCubit, SupplierInvoiceState>(
        builder: (context, state) {
          SupplierInvoiceCubit cubit = SupplierInvoiceCubit.get(context);

          if (state is SupplierInvoiceInitial) {
            cubit.getInvoices("return");
          }
          if (state is SearchData) {
            invoices = state.data.map((e) => e as ReturnInvoice).toList();
          }

          return Column(
            children: [
              TopInvoicesSearch(
                text: ' مرتجع العملاء',
                onPressedSearch: () {},
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: CustomDataTable(
                    columns: [
                      DataColumn(label: AddIconButton(
                        onPressed: () async {
                          ReturnInvoice invoice = await Navigator.pushNamed(
                                  context, 'addCustomerReturnedData')
                              as ReturnInvoice;
                          cubit.addInvoice(invoice, "return");
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
                            onTapEdit: (index) {},
                            onTapDelete: (index) {},
                          )),
                          DataCell(Text("${index + 1}")),
                          DataCell(Text(invoices[index].part)),
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
