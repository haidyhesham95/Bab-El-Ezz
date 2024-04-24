import 'package:bab_el_ezz/shared_utils/styles/colors.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';
import 'package:flutter/material.dart';
import '../../../shared_utils/styles/text.dart';

class StaffDataTable extends StatelessWidget {
  const StaffDataTable({super.key, required this.rows, required this.onPressed});
  final List<DataRow> rows;
  final dynamic Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return CustomDataTable(
      columns: [
         DataColumn(label: TextButton(
           onPressed: onPressed,
             child: Text(' +',style: AppStyles.styleSemiBold20(context).copyWith(color: ColorsAsset.kGreen),))),

        const DataColumn(label: Text(' اسم الفني ')),
        const DataColumn(label: Text(' الرقم القومي ')),
        const DataColumn(label: Text(' التخصص ')),
        const DataColumn(label: Text(' الدرجة الوظيفية ')),
        const DataColumn(label: Text(' ملاحظات ')),
        const DataColumn(label: Text('تصفية حساب ')),

      ],
      rows: rows,
    );
  }
}