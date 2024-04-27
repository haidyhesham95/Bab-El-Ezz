import 'package:bab_el_ezz/features/staff/widget/add_staff_item.dart';
import 'package:bab_el_ezz/shared_utils/styles/colors.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';
import 'package:flutter/material.dart';
import '../../../shared_utils/styles/text.dart';
import '../../../shared_utils/utils/widget/button_widget.dart';
import '../../../shared_utils/utils/widget/drop_menu.dart';

class StaffDataTable extends StatelessWidget {
  const StaffDataTable({super.key, });


  @override
  Widget build(BuildContext context) {
    return CustomDataTable(
      columns: [
        DataColumn(
            label: IconButton(
                onPressed: (){
                 Navigator.pushNamed(context,'addStaffItem');
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 20,
                ))),
        const DataColumn(label: Text(' اسم الفني ')),
        const DataColumn(label: Text(' الرقم القومي ')),
        const DataColumn(label: Text(' التخصص ')),
        const DataColumn(label: Text(' الدرجة الوظيفية ')),
        const DataColumn(label: Text(' ملاحظات ')),
        const DataColumn(label: Text('التفاصيل ')),
      ],
      rows: List.generate(
        1,
        (index) => DataRow(
          cells: <DataCell>[
            DataCell(DropMenu(
              onTapEdit: () {},
              onTapDelete: () {},
            )),
            DataCell(Text('dfdd')),
            DataCell(Text('hhhhhh')),
            DataCell(Text('dfdd')),
            DataCell(Text('dfdd')),
            DataCell(Text('dfdd')),
            DataCell(
              ButtonWidget(
                height: 25,
                onPressed: () {
                  Navigator.of(context).pushNamed('accountClearancePage');
                },
                text: 'عرض التفاصيل',
                fontStyle: AppStyles.styleSemiBold12(context)
                    .copyWith(color: Colors.white),
                borderRadius: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
