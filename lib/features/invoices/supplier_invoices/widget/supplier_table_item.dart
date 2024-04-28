
import 'package:flutter/material.dart';

import '../../../../shared_utils/styles/colors.dart';
import '../../../../shared_utils/styles/text.dart';
import '../../../../shared_utils/utils/widget/data_text_field.dart';
import '../../../../shared_utils/utils/widget/drop_menu.dart';
import '../../../../shared_utils/utils/widget/text_field.dart';

DataRow supplierTableItem(context , dynamic Function()? onPressed) {
  final size = MediaQuery.of(context).size;
  return DataRow(
    cells: [
      DataCell(
      DropMenu(
      onTapEdit: () {},
  onTapDelete: () {},
  )),
      DataCell(Text('dfdd')),
      DataCell(
          DataTextField(
            hintText: 'ادخل اسمك',

          )

      ),
      DataCell(
        DataTextField(
          hintText: " +20 ",

        )
      ),
      DataCell(
      DataTextField(
        hintText:' ادخل اسم الشركه '
      )
      ),
      DataCell(Text('dfdd')),
      DataCell(Text('dfdd')),
      DataCell(Text('dfdd')),
      DataCell(Text('---')),


    ],
  );
}