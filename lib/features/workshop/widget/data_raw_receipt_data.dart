import 'package:bab_el_ezz/shared_utils/utils/widget/data_text_field.dart';
import 'package:flutter/material.dart';

import '../../../shared_utils/styles/text.dart';
import '../../../shared_utils/utils/widget/drop_menu.dart';
import '../../../shared_utils/utils/widget/text_field.dart';

DataRow dataRowReceiptData(context,) {
  final size = MediaQuery.of(context).size;
  return DataRow(
    cells: <DataCell>[
      DataCell(
          DropMenu(
            onTapEdit: () {},
            onTapDelete: () {},
          )),
      DataCell(Text('50000')),
      DataCell(
          DataTextField(
            hintText: 'اضافه صنف',


          )
      ),      DataCell(Text('50000')),
      DataCell(Text('1200')),
      DataCell(Text('1200')),
      DataCell(Text('1200')),


      DataCell(
          DataTextField(
            hintText: 'اضافه ملاحظه',
          )
          ),
    ],
  );
}