import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';
import 'package:flutter/material.dart';
import '../../../../shared_utils/styles/colors.dart';
import '../../../../shared_utils/styles/text.dart';
import '../../../../shared_utils/utils/widget/add_icon_button.dart';
import '../../../../shared_utils/utils/widget/drop_menu.dart';


class MaintenanceInvoiceTable extends StatelessWidget {
  const MaintenanceInvoiceTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: CustomDataTable(
          columns: [
            DataColumn(label: addIconButton((){
              Navigator.pushNamed(context, 'addMaintenanceInvoiceData');

            })),
            const DataColumn(label: Text('مسلسل')),
            const DataColumn(label: Text('رقم الفاتورة')),
            const DataColumn(label: Text('التاريخ')),
            const DataColumn(label: Text('اسم العميل')),
            const DataColumn(label: Text('رقم التليفون')),
            const DataColumn(label: Text('ماركة السيارة')),
            const DataColumn(label: Text('رقم اللوحة')),
            const DataColumn(label: Text('صورة الفاتورة')),
          ],
          rows: List.generate(
            2,
            (index) => DataRow(
              cells: <DataCell>[
                    DataCell(
                        DropMenu(
                          onTapEdit: () {},
                          onTapDelete: () {},
                        )),
                DataCell(Text('dfddh')),
                DataCell(Text('dfddh')),
                DataCell(Text('dfddh')),
                DataCell(Text('dfddh')),
                DataCell(Text('dfddh')),
                DataCell(Text('dfddh')),
                DataCell(Text('dfddh')),
                DataCell(Text('dfddh')),
              ],
            ),
          )),
    );
  }
}
