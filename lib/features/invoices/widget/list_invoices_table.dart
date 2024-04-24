import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';
import 'package:flutter/material.dart';
import '../../../shared_utils/styles/colors.dart';
import '../../../shared_utils/styles/text.dart';


class ListInvoiceTable extends StatelessWidget {
  const ListInvoiceTable({super.key});

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
                DataCell(TextButton(
                    onPressed: () {},
                    child: Text(
                      '...',
                      style: AppStyles.styleSemiBold20(context)
                          .copyWith(color: ColorsAsset.kGreen),
                    ))),
                DataCell(Text('dfddh')),
                DataCell(Text('dfddh')),
                DataCell(Text('dfddh')),
                DataCell(Text('dfddh')),
                DataCell(Text('dfddh')),
                DataCell(Text('dfddh')),
                DataCell(Text('dfddh')),
                DataCell(Text('dfddh')),
              ],
            ),
          )),
    );
  }
}
