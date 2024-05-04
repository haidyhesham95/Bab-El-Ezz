import 'package:flutter/material.dart';

import '../../../../shared_utils/utils/widget/custom_data_table.dart';

class InvoiceDetailsTable extends StatelessWidget {
  const InvoiceDetailsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDataTable(
        columns: const [

          DataColumn(label: Text('مسلسل')),
          DataColumn(label: Text('الصنف')),
          DataColumn(label: Text('الكمية')),
          DataColumn(label: Text('السعر')),
          DataColumn(label: Text('الخصم')),
          DataColumn(label: Text('الاجمالي')),

          DataColumn(label: Text('ملاحظات')),
        ],
        rows:  List. generate(3,( index) => const DataRow(
    cells: <DataCell>[
    DataCell(Text('5222')),
    DataCell(Text('5000000')),
    DataCell(Text('1200')),
    DataCell(Text('1200')),
    DataCell(Text('1200')),
    DataCell(Text('1200')),
    DataCell(Text('1200')),
    ],
    )),
    );
  }
}

