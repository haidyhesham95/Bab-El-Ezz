import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';

import 'package:flutter/material.dart';


class AddReceiptTable extends StatelessWidget {
  const AddReceiptTable({super.key,required this. rows,required this.onPressed});
  final List<DataRow> rows;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: CustomDataTable(
            columns: [
              DataColumn(label: IconButton(
                icon: const Icon(Icons.add, color: Colors.white,size: 25, ),
                onPressed: onPressed,
              )),

              const DataColumn(label: Text(' الصنف ')),
              const DataColumn(label: Text(' الكمية ')),
              const DataColumn(label: Text(' السعر ')),
              const DataColumn(label: Text(' الخصم ')),
              const DataColumn(label: Text(' المصنعية ')),
              const DataColumn(label: Text(' الإجمالي ')),
              const DataColumn(label: Text(' ملاحظات ')),

            ],
            rows: rows
        )
    );
  }
}
