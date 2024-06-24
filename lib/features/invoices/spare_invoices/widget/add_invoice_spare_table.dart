import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';
import 'package:flutter/material.dart';

class AddInvoiceSpareTable extends StatelessWidget {
  const AddInvoiceSpareTable({super.key, required this.rows});
  final List<DataRow> rows;
  @override
  Widget build(BuildContext context) {
    return CustomDataTable(
      columns: const [
        DataColumn(
          label: Text(''),
        ),
        DataColumn(
          label: Text('الصنف'),
        ),
        DataColumn(label: Text('الكمية')),
        DataColumn(label: Text('السعر')),
        DataColumn(label: Text('ملاحظات')),
      ],
      rows: rows,
    );
  }
}
