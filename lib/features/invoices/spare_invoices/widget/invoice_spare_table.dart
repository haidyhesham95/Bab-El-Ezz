import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';
import 'package:flutter/material.dart';

import '../../../../shared_utils/utils/widget/add_icon_button.dart';
import '../../../../shared_utils/utils/widget/drop_menu.dart';

class InvoiceSpareTable extends StatelessWidget {
  const InvoiceSpareTable({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: CustomDataTable(
        columns: [
          DataColumn(label: AddIconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'addInvoiceSpareData');
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
          2,
          (index) => DataRow(
            cells: <DataCell>[
              DataCell(DropMenu(
                onTapEdit: (index) {},
                onTapDelete: (index) {},
              )),
              const DataCell(Text('dfddh')),
              const DataCell(Text('dfddh')),
              const DataCell(Text('dfddh')),
              const DataCell(Text('dfddh')),
              const DataCell(Text('dfddh')),
              const DataCell(Text('dfddh')),
            ],
          ),
        ),
      ),
    );
  }
}
