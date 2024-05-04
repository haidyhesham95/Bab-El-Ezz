
import 'package:flutter/material.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';
import '../../../../shared_utils/utils/widget/add_icon_button.dart';
import '../../../../shared_utils/utils/widget/drop_menu.dart';

class MaintenanceCustomerTable extends StatelessWidget {
  const MaintenanceCustomerTable({super.key, this.showAllDataCustomers=false});
 final bool showAllDataCustomers;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: CustomDataTable(
        columns: [
          DataColumn(label: Container(
            margin: const EdgeInsets.all(5),
            child: addIconButton(context,(){
              Navigator.pushNamed(context, 'addClient');
            
            }),
          )),
          if (showAllDataCustomers) ...[
          const DataColumn(label: Text('مسلسل')),
    ],


    const DataColumn(label: Text('الاسم')),
          const DataColumn(label: Text('رقم التليفون')),
          const DataColumn(label: Text('ماركة السيارة')),

    if (showAllDataCustomers) ...[

          const DataColumn(label: Text('الموديل')),
          const DataColumn(label: Text('سنة الصنع')),
          const DataColumn(label: Text('رقم اللوحة')),
          const DataColumn(label: Text('رقم الشاشة')),
          const DataColumn(label: Text('رقم الماتور')),
          const DataColumn(label: Text('نوع ناقل الحركة')),

        ],

        const DataColumn(label: Text('عدد مرات الزيارة')),
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
        if (showAllDataCustomers) ...[

    const DataCell(Text('dfdd')),
    ],

    const DataCell(Text('hhhhhh')),
            const DataCell(Text('dfdd')),
            const DataCell(Text('dfdd')),
            if (showAllDataCustomers) ...[
              const DataCell(Text('dfdd')),

            const DataCell(Text('dfdd')),
            const DataCell(Text('dfdd')),
            const DataCell(Text('dfdd')),
            const DataCell(Text('dfdd')),
            const DataCell(Text('dfdd')),
            ],
            const DataCell(Text('dfdd')),
        ],
        ),
      )),


    );
  }
}