import 'package:bab_el_ezz/features/invoices/supplier_invoices/manager/supplier_invoice/supplier_invoice_cubit.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared_utils/utils/widget/add_icon_button.dart';
import '../../../../shared_utils/utils/widget/drop_menu.dart';

class InvoicesSuppliersTable extends StatelessWidget {
  const InvoicesSuppliersTable({super.key, required this.showAllDataInvoices});
  final bool showAllDataInvoices;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => SupplierInvoiceCubit(),
      child: BlocBuilder<SupplierInvoiceCubit, SupplierInvoiceState>(
        builder: (context, state) {
          SupplierInvoiceCubit cubit = SupplierInvoiceCubit.get(context);
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: CustomDataTable(
              columns: [
                DataColumn(label: AddIconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'addInvoiceData');
                  },
                )),
                if (showAllDataInvoices) ...[
                  const DataColumn(label: Text('مسلسل')),
                ],
                const DataColumn(label: Text('اسم المورد')),
                const DataColumn(label: Text('التاريخ')),
                const DataColumn(label: Text('رقم الفاتورة')),
                if (showAllDataInvoices) ...[
                  const DataColumn(label: Text('اجمالي الفاتورة')),
                  const DataColumn(label: Text('المدفوع')),
                  const DataColumn(label: Text('الاجل')),
                  const DataColumn(label: Text(' تاريخ الاستحقاق ')),
                ],
                const DataColumn(label: Text('صورة الفاتورة')),
              ],
              rows: List.generate(
                2,
                (index) => DataRow(
                  cells: <DataCell>[
                    DataCell(DropMenu(
                      onTapEdit: (index) {},
                      onTapDelete: (index) {},
                    )),
                    if (showAllDataInvoices) ...[
                      const DataCell(Text('dfddh')),
                    ],
                    const DataCell(Text('dfddh')),
                    const DataCell(Text('dfddh')),
                    const DataCell(Text('dfddh')),
                    if (showAllDataInvoices) ...[
                      const DataCell(Text('dfddh')),
                      const DataCell(Text('dfddh')),
                      const DataCell(Text('dfddh')),
                      const DataCell(Text('dfddh')),
                    ],
                    const DataCell(Text('dfddh')),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
