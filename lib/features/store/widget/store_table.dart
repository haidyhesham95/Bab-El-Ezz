import 'package:bab_el_ezz/shared_utils/styles/colors.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';
import 'package:flutter/material.dart';
import '../../../shared_utils/styles/text.dart';
import '../../../shared_utils/utils/widget/button_widget.dart';

class StoreTable extends StatelessWidget {
  const StoreTable({super.key,});
 // final List<DataRow> rows;
  @override
  Widget build(BuildContext context) {
    return CustomDataTable(
      columns: [
        const DataColumn(label: Text(' مسلسل ')),
        const DataColumn(label: Text(' اسم الصنف ')),
        const DataColumn(label: Text(' كود الصنف ')),
        const DataColumn(label: Text(' الكمية ')),
        const DataColumn(label: Text(' الماركة ')),
        const DataColumn(label: Text(' سعر الجملة ')),
        const DataColumn(label: Text(' سعر البيع ')),
        const DataColumn(label: Text(' تنبيه ')),
      ],
      rows: List.generate(
        2,
            (index) => DataRow(
          cells: <DataCell>[
            DataCell(Text('2')),
            DataCell(Text('dfdd')),
            DataCell(Text('dfdd')),
            DataCell(Text('45')),
            DataCell(Text('dfdd')),
            DataCell(Text('dfdd')),
            DataCell(Text('dfdd')),
            DataCell(Text('dfdd')),
          ],
        ),
      ),
    );
  }
}

