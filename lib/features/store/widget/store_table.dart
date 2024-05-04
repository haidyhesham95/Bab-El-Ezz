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
            const DataCell(Text('2')),
            const DataCell(Text('dfdd')),
            const DataCell(Text('dfdd')),

            if (  showAllData) ...[
              const DataCell(Text('45')),
              const DataCell(Text('dfdd')),
              const DataCell(Text('dfdd')),
              const DataCell(Text('dfdd')),
              const DataCell(Text('dfdd')),
            ],
          ],
        ),
      ),
    );
  }
}
