import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';
import 'package:flutter/material.dart';



class DetailsMaintenanceTable extends StatelessWidget {
  const DetailsMaintenanceTable({super.key, required this.showAllDataInvoices});
  final bool showAllDataInvoices ;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: CustomDataTable(
          columns: [

            if (showAllDataInvoices) ...[

              const DataColumn(label: Text('مسلسل')),
            ],
            const DataColumn(label: Text('اسم العميل')),
            const DataColumn(label: Text('رقم التليفون')),
            const DataColumn(label: Text('التاريخ')),
            if (showAllDataInvoices) ...[

              const DataColumn(label: Text('رقم الفاتورة')),
              const DataColumn(label: Text('ماركة السيارة')),
              const DataColumn(label: Text('رقم اللوحة')),
            ],
            const DataColumn(label: Text('صورة الفاتورة')),

          ],
          rows: List.generate(
            3,
                (index) => DataRow(
                cells: <DataCell>[

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
                  ],
                  const DataCell(Text('dfddh')),

                ]
            ),
          )),
    );
  }

}
