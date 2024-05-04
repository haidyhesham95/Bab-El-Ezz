import 'package:bab_el_ezz/shared_utils/utils/widget/data_text_field.dart';
import 'package:flutter/material.dart';

import '../../../../shared_utils/utils/widget/drop_menu.dart';


DataRow dataRowReceiptData(context,) {
  final size = MediaQuery.of(context).size;
  return DataRow(
    cells: <DataCell>[
      DataCell(
          DropMenu(
            onTapEdit: () {},
            onTapDelete: () {},
          )),
      const DataCell(Text('50000')),
      const DataCell(
          DataTextField(
            hintText: 'اضافه صنف',


          )
      ),      const DataCell(Text('50000')),
      const DataCell(Text('1200')),
      const DataCell(Text('1200')),
      const DataCell(Text('1200')),


      const DataCell(
          DataTextField(
            hintText: 'اضافه ملاحظه',
          )
          ),
    ],
  );
}