import 'package:flutter/material.dart';
import '../../../../shared_utils/utils/widget/add_icon_button.dart';
import '../../../../shared_utils/utils/widget/custom_data_table.dart';

class SupplierTable extends StatelessWidget {
  const SupplierTable({super.key, required this.rows, this.onPressed});

  final List<DataRow> rows;
  final dynamic Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: CustomDataTable(
        columns: [
          DataColumn(label: addIconButton(onPressed)),

          const DataColumn(label: Text('مسلسل')),
          const DataColumn(label: Text('الاسم')),
          const DataColumn(label: Text('رقم التليفون')),
          const DataColumn(label: Text('اسم الشركة')),
          const DataColumn(label: Text('عدد الفواتير')),
          const DataColumn(label: Text('اجمالي الفواتير')),
          const DataColumn(label: Text('اجمالي المدفوع')),
          const DataColumn(label: Text('اجمالي المتبقي')),
        ],
        rows: rows,
      ),
    );
  }
}
