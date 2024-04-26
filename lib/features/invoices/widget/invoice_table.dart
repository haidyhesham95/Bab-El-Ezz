import 'package:flutter/material.dart';
import 'package:bab_el_ezz/shared_utils/styles/colors.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';
import '../../../shared_utils/styles/text.dart';

class InvoiceTable extends StatelessWidget {
  const InvoiceTable({super.key,  required this.onPressed});
 // final List<DataRow> rows;
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
          const DataColumn(label: Text('اسم المورد')),
          const DataColumn(label: Text('التاريخ')),
          const DataColumn(label: Text('رقم الفاتورة')),
          const DataColumn(label: Text('اجمالي الفاتورة')),
          const DataColumn(label: Text('المدفوع')),
          const DataColumn(label: Text('الاجل')),
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
        ),
      ),
    );
  }
}