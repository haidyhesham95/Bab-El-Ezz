import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';
import 'package:flutter/material.dart';
import '../../../shared_utils/styles/colors.dart';
import '../../../shared_utils/utils/widget/drop_menu.dart';

class SpareReceiptData extends StatelessWidget {
  const SpareReceiptData({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDataTable(
      columns: [
    DataColumn(
    label:RotationTransition(
    turns: const AlwaysStoppedAnimation(90 / 360),
    child: Icon(Icons.more_vert,color:  ColorsAsset.kGreen,size: 20,))),
        DataColumn(label: Text('مسلسل')),
        DataColumn(label: Text('الصنف')),
        DataColumn(label: Text('الكمية')),
        DataColumn(label: Text('المبلغ')),
        DataColumn(label: Text('ملاحظات')),
        DataColumn(label: Text('الاجمالي')),
      ],
      rows: List.generate(
        5,
        (index) => DataRow(
          cells: <DataCell>[
            DataCell(
                DropMenu(
                  onTapEdit: () {},
                  onTapDelete: () {},
                )),
            DataCell(Text('50000')),
            DataCell(Text('1200')),
            DataCell(Text('50000')),
            DataCell(Text('1200')),
            DataCell(Text('50000')),
            DataCell(Text('1200')),
          ],
        ),
      ),
    );
  }
}
