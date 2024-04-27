import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';
import 'package:flutter/material.dart';
import '../../../shared_utils/styles/colors.dart';
import '../../../shared_utils/utils/widget/drop_menu.dart';

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
                icon: Icon(Icons.add,color:  Colors.white,size: 20,))),
        DataColumn(label: Text('مسلسل')),
        DataColumn(label: Text('الصنف')),
        DataColumn(label: Text('الكمية')),
        DataColumn(label: Text('المبلغ')),
        DataColumn(label: Text('الخصم')),
        DataColumn(label: Text('الاجمالي')),

        DataColumn(label: Text('ملاحظات')),
      ],
      rows: rows
    );
  }
}
