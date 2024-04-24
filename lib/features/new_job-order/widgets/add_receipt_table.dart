import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';

import 'package:flutter/material.dart';

import '../../../shared_utils/styles/colors.dart';
import '../../../shared_utils/styles/text.dart';

class AddReceiptTable extends StatelessWidget {
  const AddReceiptTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: CustomDataTable(
            columns: [
              DataColumn(
                  label: TextButton(
                      onPressed: () {},
                      child: Text(
                        '...',
                        style: AppStyles.styleSemiBold20(context)
                            .copyWith(color: ColorsAsset.kGreen),
                      ))),
              DataColumn(label: Text(' الصنف ')),
              DataColumn(label: Text(' الكمية ')),
              DataColumn(label: Text(' المبلغ ')),
              DataColumn(label: Text(' ملاحظات ')),
              DataColumn(label: Text(' الخصم ')),
              DataColumn(label: Text(' اضافة صنف او خدمة ')),
              DataColumn(label: Text(' المصنعية ')),
              DataColumn(label: Text(' الإجمالي ')),
            ],
            rows: List.generate(
                10,
                (index) => DataRow(cells: [
                      DataCell(TextButton(
                          onPressed: () {},
                          child: Text(
                            '...',
                            style: AppStyles.styleSemiBold20(context)
                                .copyWith(color: ColorsAsset.kGreen),
                          ))),
                      DataCell(Text('kk')),
                      DataCell(Text('25')),
                      DataCell(Text('250')),
                      DataCell(Text('----')),
                      DataCell(Text('الخصم')),
                      DataCell(Text('اضافة صنف او خدمة')),
                      DataCell(Text('5%')),
                      DataCell(Text('الإجمالي')),
                    ]))));
  }
}
