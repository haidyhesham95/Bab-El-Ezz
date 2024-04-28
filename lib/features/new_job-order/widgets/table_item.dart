import 'package:bab_el_ezz/shared_utils/utils/widget/data_text_field.dart';
import 'package:flutter/material.dart';

import '../../../shared_utils/styles/text.dart';
import '../../../shared_utils/utils/widget/drop_menu.dart';
import '../../../shared_utils/utils/widget/text_field.dart';

DataRow tableItem(BuildContext context) {
  final size = MediaQuery.of(context).size;
  return DataRow(cells: [
    DataCell(
        DropMenu(
          onTapEdit: () {},
          onTapDelete: () {},
        )),

    DataCell(
      DataTextField(
  hintText: 'اضافه صنف',
  ),
       ),
    DataCell(Text('25')),
    DataCell(Text('250')),
    DataCell(Text('الخصم')),
    DataCell(Text('5%')),
    DataCell(Text('الإجمالي')),
    DataCell(
      DataTextField(
  hintText: 'اضافه ملاحظه',
      )),
  ]);



}