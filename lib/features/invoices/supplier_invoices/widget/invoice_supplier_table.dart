import 'package:flutter/material.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';
import '../../../../shared_utils/utils/widget/add_icon_button.dart';
import '../../../../shared_utils/utils/widget/drop_menu.dart';

class InvoicesSuppliersTable extends StatelessWidget {
  const InvoicesSuppliersTable({super.key, required this.showAllDataInvoices  });
  final bool showAllDataInvoices ;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: CustomDataTable(
        columns: [
          DataColumn(label: addIconButton(context,(){
            Navigator.pushNamed(context, 'addInvoiceData');

          })),
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
              DataCell(  DropMenu(
                onTapEdit: (){},
                onTapDelete: (){},


              )),
        if (showAllDataInvoices) ...[

    DataCell(Text('dfddh')),
              ],
              DataCell(Text('dfddh')),
              DataCell(Text('dfddh')),
              DataCell(Text('dfddh')),
    if (showAllDataInvoices) ...[

    DataCell(Text('dfddh')),
              DataCell(Text('dfddh')),
              DataCell(Text('dfddh')),
              DataCell(Text('dfddh')),
              ],
              DataCell(Text('dfddh')),

            ],
          ),
        ),
      ),
    );
  }
}