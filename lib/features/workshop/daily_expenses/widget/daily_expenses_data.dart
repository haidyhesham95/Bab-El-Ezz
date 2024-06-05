import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';
import 'package:flutter/material.dart';

import '../../../../shared_utils/utils/widget/drop_menu.dart';

class DailyExpensesData extends StatelessWidget {
  const DailyExpensesData({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDataTable(
      columns: [
        DataColumn(
            label: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "addDailyExpenses");
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 20,
                ))),
        const DataColumn(label: Text('البند')),
        const DataColumn(label: Text('المبلغ')),
        const DataColumn(label: Text('الاجمالي')),
      ],
      rows: List.generate(
        5,
        (index) => DataRow(
          cells: <DataCell>[
            DataCell(DropMenu(
              onTapEdit: (index) {},
              onTapDelete: (index) {},
            )),
            const DataCell(Text('5222')),
            const DataCell(Text('5000000')),
            const DataCell(Text('1200')),
          ],
        ),
      ),
    );
  }
}
