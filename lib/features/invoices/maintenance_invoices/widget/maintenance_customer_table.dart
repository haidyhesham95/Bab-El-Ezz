
import 'package:flutter/material.dart';
import 'package:bab_el_ezz/shared_utils/styles/colors.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';
import '../../../../shared_utils/styles/text.dart';
import '../../../../shared_utils/utils/widget/add_icon_button.dart';
import '../../../../shared_utils/utils/widget/drop_menu.dart';

class MaintenanceCustomerTable extends StatelessWidget {
  const MaintenanceCustomerTable({super.key,});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: CustomDataTable(
        columns: [
          DataColumn(label: addIconButton((){
            Navigator.pushNamed(context, 'addMaintenanceCustomer');

          })),
          const DataColumn(label: Text('مسلسل')),
          const DataColumn(label: Text('الاسم')),
          const DataColumn(label: Text('رقم التليفون')),
          const DataColumn(label: Text('ماركة السيارة')),
          const DataColumn(label: Text('الموديل')),
          const DataColumn(label: Text('سنة الصنع')),
          const DataColumn(label: Text('رقم اللوحة')),
          const DataColumn(label: Text('رقم الشاشة')),
          const DataColumn(label: Text('رقم الماتور')),
          const DataColumn(label: Text('نوع ناقل الحركة')),
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
            DataCell(Text('dfdd')),
            DataCell(Text('hhhhhh')),
            DataCell(Text('dfdd')),
            DataCell(Text('dfdd')),
            DataCell(Text('dfdd')),
            DataCell(Text('dfdd')),
            DataCell(Text('dfdd')),
            DataCell(Text('dfdd')),
            DataCell(Text('dfdd')),
            DataCell(Text('dfdd')),
            DataCell(Text('dfdd')),
          ],
        ),
      )),


    );
  }
}