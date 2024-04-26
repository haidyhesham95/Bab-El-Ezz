import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';

import 'package:flutter/material.dart';


class DailyExpensesData extends StatelessWidget {
  const DailyExpensesData({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDataTable(
      //columnSpacing: 100,
     // horizontalMargin: 20,
      columns: [
        DataColumn(label: Text('البند')),
        DataColumn(label: Text('المبلغ')),
        DataColumn(label: Text('الاجمالي')),
      ],
      rows: List.generate(
        5,
        (index) => DataRow(
          cells: <DataCell>[
            DataCell(Text('5222')),
            DataCell(Text('5000000')),
            DataCell(Text('1200')),
          ],
        ),
      ),
    );
  }
}