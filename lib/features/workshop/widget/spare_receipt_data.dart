import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';
import 'package:flutter/material.dart';
import '../../../shared_utils/styles/colors.dart';
import '../../../shared_utils/styles/text.dart';

class SpareReceiptData extends StatelessWidget {
  const SpareReceiptData({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDataTable(
      columns: [
        DataColumn(
            label: TextButton(
                onPressed: () {},
                child: Text(
                  '...',
                  style: AppStyles.styleSemiBold20(context)
                      .copyWith(color: ColorsAsset.kGreen),
                ))),
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
            DataCell(TextButton(
                onPressed: () {},
                child: Text(
                  '...',
                  style: AppStyles.styleSemiBold20(context)
                      .copyWith(color: ColorsAsset.kGreen),
                ))),
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
