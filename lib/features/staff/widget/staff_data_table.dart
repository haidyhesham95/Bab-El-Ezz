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
      columns: const [
        DataColumn(label: Text('')),

    DataColumn(label: Text(' اسم الفني ')),
        DataColumn(label: Text(' الرقم القومي ')),
        DataColumn(label: Text(' التخصص ')),
        DataColumn(label: Text(' الدرجة الوظيفية ')),
        DataColumn(label: Text(' القيمة اليومية ')),
        DataColumn(label: Text('التفاصيل ')),
      ],
      rows: List.generate(
        1,
        (index) => DataRow(
          cells: <DataCell>[
            DataCell(DropMenu(
              onTapEdit: () {},
              onTapDelete: () {},
            )),
            const DataCell(Text('dfdd')),
            const DataCell(Text('hhhhhh')),
            const DataCell(Text('dfdd')),
            const DataCell(Text('dfdd')),
            const DataCell(Text('dfdd')),
            DataCell(
              ButtonWidget(
                height: 25,
                onPressed: () {
                  Navigator.of(context).pushNamed('viewDetailsPage');
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
