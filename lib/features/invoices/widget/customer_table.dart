
import 'package:flutter/material.dart';
import 'package:bab_el_ezz/shared_utils/styles/colors.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';
import '../../../shared_utils/styles/text.dart';
import '../../../shared_utils/utils/widget/drop_menu.dart';

class CustomerTable extends StatelessWidget {
  const CustomerTable({super.key,  required this.onPressed});
  final dynamic Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: CustomDataTable(
        columns: [
          DataColumn(
              label: IconButton(
      icon: const Icon(Icons.add,size: 20,),
        color: Colors.white,
        onPressed: onPressed)),
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
            DataCell(Text('dfdd')),
            DataCell(Text('hhhhhh')),
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