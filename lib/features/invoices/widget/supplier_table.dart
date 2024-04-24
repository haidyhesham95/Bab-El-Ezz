import 'package:flutter/material.dart';

import '../../../shared_utils/styles/colors.dart';
import '../../../shared_utils/styles/text.dart';
import '../../../shared_utils/utils/widget/custom_data_table.dart';

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
          DataColumn(
              label: TextButton(
                  onPressed: onPressed,
                  child: Text(
                    '+',
                    style: AppStyles.styleSemiBold20(context)
                        .copyWith(color: ColorsAsset.kGreen),
                  ))),
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
