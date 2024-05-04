import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';
import 'package:flutter/material.dart';

import '../../../shared_utils/utils/widget/drop_menu.dart';

class StoreTable extends StatelessWidget {
  const StoreTable({Key? key,required this.showAllData}) : super(key: key);

  final bool showAllData;
  @override
  Widget build(BuildContext context) {
    return CustomDataTable(
      columns: [
        const DataColumn(label: Text('  ')),
        const DataColumn(label: Text(' مسلسل ')),
        const DataColumn(label: Text(' اسم الصنف ')),
        const DataColumn(label: Text(' الكمية ')),

        if (showAllData) ...[
          const DataColumn(label: Text(' كود الصنف ')),
          const DataColumn(label: Text(' الماركة ')),
          const DataColumn(label: Text(' سعر الجملة ')),
          const DataColumn(label: Text(' سعر البيع ')),
          const DataColumn(label: Text(' تنبيه ')),
        ],
      ],
      rows: List.generate(
           3 ,
            (index) => DataRow(
          cells: <DataCell>[
            DataCell(
              DropMenu(
                onTapEdit: () {},
                onTapDelete: () {},
              ),
            ),
            DataCell(Text('2')),
            DataCell(Text('dfdd')),
            DataCell(Text('dfdd')),

            if (  showAllData) ...[
              DataCell(Text('45')),
              DataCell(Text('dfdd')),
              DataCell(Text('dfdd')),
              DataCell(Text('dfdd')),
              DataCell(Text('dfdd')),
            ],
          ],
        ),
      ),
    );
  }
}
