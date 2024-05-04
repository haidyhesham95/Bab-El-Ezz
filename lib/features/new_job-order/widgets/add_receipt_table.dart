import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';

import 'package:flutter/material.dart';

import '../../../shared_utils/utils/widget/add_icon_button.dart';

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
                icon: Icon(Icons.add, color: Colors.white,size: 25, ),
                onPressed: onPressed,
              )),

              DataColumn(label: Text(' الصنف ')),
              DataColumn(label: Text(' الكمية ')),
              DataColumn(label: Text(' السعر ')),
              DataColumn(label: Text(' الخصم ')),
              DataColumn(label: Text(' المصنعية ')),
              DataColumn(label: Text(' الإجمالي ')),
              DataColumn(label: Text(' ملاحظات ')),

            ],
            rows: rows
        )
    );
  }
}
