import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';
import 'package:flutter/material.dart';

class SpareReceiptData extends StatelessWidget {
  const SpareReceiptData({super.key, required this.rows,required this.onPressed});
  final List<DataRow> rows;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return CustomDataTable(
      columns: [
        DataColumn(
            label:IconButton(
                onPressed: onPressed,
                icon: const Icon(Icons.add,color:  Colors.white,size: 20,))),
        const DataColumn(label: Text('مسلسل')),
        const DataColumn(label: Text('الصنف')),
        const DataColumn(label: Text('الكمية')),
        const DataColumn(label: Text('السعر')),
        const DataColumn(label: Text('الخصم')),
        const DataColumn(label: Text('الاجمالي')),

        const DataColumn(label: Text('ملاحظات')),
      ],
      rows: rows
    );
  }
}
