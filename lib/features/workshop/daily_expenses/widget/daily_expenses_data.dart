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
      ],
      rows: [
        ...List.generate(
          4,
          (index) => DataRow(
            cells: <DataCell>[
              DataCell(DropMenu(
                onTapEdit: (index) {},
                onTapDelete: (index) {},
              )),
              const DataCell(Text('5222')), // Replace with actual item data
              DataCell(Text('200')),
            ],
          ),
        ),
        DataRow(
          cells: <DataCell>[
            const DataCell(Text(
              'الاجمالي',
            )),
            const DataCell(Text('')), // Empty cell for alignment
            DataCell(Text('4000',
                style: const TextStyle(fontWeight: FontWeight.bold))),
          ],
        ),
      ],
    );
  }
}
