import 'package:bab_el_ezz/data/customer.dart';
import 'package:bab_el_ezz/data/spare_invoice.dart';
import 'package:bab_el_ezz/features/invoices/invoices/widget/top_invoice_search.dart';
import 'package:bab_el_ezz/features/invoices/supplier_invoices/manager/supplier_invoice/supplier_invoice_cubit.dart';
import 'package:bab_el_ezz/shared_utils/utils/constant.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared_utils/utils/widget/drop_menu.dart';

class CustomerSpareTable extends StatelessWidget {
  CustomerSpareTable({
    super.key,
  });

  List<SpareInvoice> invoices = [];
  final TextEditingController controller = TextEditingController();

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
            invoices = cubit.getUniqueSpareInvoicesByClientName(
                state.data.map((e) => e as SpareInvoice).toList());
          }

          return Column(
            children: [
              TopInvoicesSearch(
                  controller: controller,
                  onPressedSearch: () {
                    cubit.searchInvoices(controller.text);
                  },
                  height: 70,
                  text: " قائمة العملاء",
                  hintText: 'البحث عن عميل'),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: CustomDataTable(
                  columns: [
                    DataColumn(label: Container()),
                    const DataColumn(label: Text('مسلسل')),
                    const DataColumn(label: Text('الاسم')),
                    const DataColumn(label: Text('رقم التليفون')),
                    const DataColumn(label: Text('عدد الفواتير')),
                    const DataColumn(label: Text('اجمالي  قيم الفواتير')),
                  ],
                  rows: List.generate(
                    invoices.length,
                    (index) => DataRow(
                      cells: <DataCell>[
                        DataCell(DropMenu(
                          index: index,
                          onTapEdit: (index) async {
                            Customer customer = await Navigator.pushNamed(
                                context, 'AddCustomerInSpareInvoice',
                                arguments: Customer(
                                    invoices[index].clientName,
                                    invoices[index].phoneNumber,
                                    '')) as Customer;
                            cubit.updateCustomer(
                                customer, invoices[index].phoneNumber);
                          },
                          onTapDelete: (index) {
                            /// cubit.deleteInvoice(invoices[index], INVOICE_SPARE);
                            cubit.deleteCustomer(invoices[index]);
                          },
                        )),
                        DataCell(Text("${index + 1}")),
                        DataCell(Text(invoices[index].clientName)),
                        DataCell(Text(invoices[index].phoneNumber)),
                        DataCell(Text(cubit.invoices
                            .where((element) =>
                                element.phoneNumber ==
                                invoices[index].phoneNumber)
                            .length
                            .toString())),
                        DataCell(Text(
                            "${cubit.invoices.where((element) => element.phoneNumber == invoices[index].phoneNumber).fold(0.0, (previousValue, element) => previousValue + (element as SpareInvoice).price)}")),
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
