import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';
import 'package:flutter/material.dart';

import '../../../../shared_utils/utils/widget/add_icon_button.dart';
import '../../../../shared_utils/utils/widget/drop_menu.dart';

class CustomerSpareTable extends StatelessWidget {
  const CustomerSpareTable({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: CustomDataTable(
        columns: [
          DataColumn(
              label: AddIconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'addCustomerSpareData');
            },
            text: 'إضافة عميل',
          )),
          const DataColumn(label: Text('مسلسل')),
          const DataColumn(label: Text('الاسم')),
          const DataColumn(label: Text('رقم التليفون')),
          const DataColumn(label: Text('عدد مرات الزياره')),
          const DataColumn(label: Text('اجمالي  قيم الفواتير')),
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
            ],
          ),
        ),
      ),
    );
  }
}
