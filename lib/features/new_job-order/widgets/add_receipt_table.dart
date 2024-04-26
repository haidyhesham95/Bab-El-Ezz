import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/text_field.dart';

import 'package:flutter/material.dart';

import '../../../shared_utils/styles/colors.dart';
import '../../../shared_utils/styles/text.dart';
import '../../../shared_utils/utils/widget/drop_menu.dart';

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
              DataColumn(
                  label:IconButton(
                      onPressed: onPressed,
                      icon: Icon(Icons.add,color:  Colors.white,size: 20,))),
              DataColumn(label: Text(' الصنف ')),
              DataColumn(label: Text(' الكمية ')),
              DataColumn(label: Text(' المبلغ ')),
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
