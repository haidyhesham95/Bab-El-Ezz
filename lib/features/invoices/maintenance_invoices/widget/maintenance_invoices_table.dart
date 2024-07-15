import 'package:bab_el_ezz/data/job_order.dart';
import 'package:bab_el_ezz/data/maintenance_invoice.dart';
import 'package:bab_el_ezz/features/invoices/invoices/widget/top_invoice_search.dart';
import 'package:bab_el_ezz/features/invoices/supplier_invoices/manager/supplier_invoice/supplier_invoice_cubit.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/show_details_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../shared_utils/utils/widget/drop_menu.dart';

class MaintenanceInvoiceTable extends StatelessWidget {
  MaintenanceInvoiceTable({super.key});

  final TextEditingController controller = TextEditingController();
  List<MaintenanceInvoice> invoices = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InvoiceCubit(),
      child: BlocBuilder<InvoiceCubit, InvoiceState>(
        builder: (context, state) {
          InvoiceCubit cubit = InvoiceCubit.get(context);

          if (state is SupplierInvoiceInitial) {
            cubit.getOrders();
          }
          if (state is SearchData) {
            invoices = state.data
                .map((e) => MaintenanceInvoice.fromJobOrder(e as JobOrder))
                .toList();
          }

          return Column(
            children: [
              TopInvoicesSearch(
                controller: controller,
                onPressedSearch: () {
                  cubit.searchInvoices(controller.text);
                },
              ),
              showDetailsText(
                  context: context,
                  onPressed: () {
                    cubit.showAll = !cubit.showAll;
                    cubit.update();
                  },
                  showAll: cubit.showAll),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: CustomDataTable(
                    columns: [
                      DataColumn(label: Container()),
                      if (cubit.showAll) ...[
                        const DataColumn(label: Text('مسلسل')),
                      ],
                      const DataColumn(label: Text('اسم العميل')),
                      const DataColumn(label: Text('رقم التليفون')),
                      const DataColumn(label: Text('التاريخ')),
                      if (cubit.showAll) ...[
                        const DataColumn(label: Text('رقم الفاتورة')),
                        const DataColumn(label: Text('ماركة السيارة')),
                        const DataColumn(label: Text('رقم اللوحة')),
                        const DataColumn(label: Text('لون السيارة')),
                      ],
                      const DataColumn(label: Text('صورة الفاتورة')),
                    ],
                    rows: List.generate(
                      invoices.length,
                      (index) => DataRow(cells: <DataCell>[
                        DataCell(DropMenu(
                          index: index,
                          onTapEdit: (index) {},
                          onTapDelete: (index) {
                            /// we have to delete the job order
                            // cubit.deleteInvoice(
                            //     invoices[index], INVOICE_MAINTENANCE);
                          },
                        )),
                        if (cubit.showAll) ...[
                          DataCell(Text("${index + 1}")),
                        ],
                        DataCell(Text(invoices[index].clientName)),
                        DataCell(Text(invoices[index].phoneNumber)),
                        DataCell(Text(DateFormat("yyyy-MM-dd hh:mm")
                            .format(invoices[index].date))),
                        if (cubit.showAll) ...[
                          DataCell(Text(invoices[index].invoiceNumber)),
                          DataCell(Text(invoices[index].carBrand)),
                          DataCell(Text(invoices[index].carPlate)),
                          DataCell(Text(invoices[index].carColor)),
                        ],
                        DataCell(IconButton(
                          icon: const Icon(Icons.image),
                          onPressed: () {
                            cubit.downloadAndOpenImage(invoices[index]);
                          },
                        )),
                      ]),
                    )),
              ),
            ],
          );
        },
      ),
    );
  }
}
