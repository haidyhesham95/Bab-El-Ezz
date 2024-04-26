import 'package:flutter/material.dart';

import '../../../shared_utils/styles/text.dart';
import '../../../shared_utils/utils/widget/drop_menu.dart';
import '../../../shared_utils/utils/widget/text_field.dart';

DataRow tableItem(BuildContext context) {
  final size = MediaQuery
      .of(context)
      .size;
  return DataRow(cells: [
    DataCell(
        DropMenu(
          onTapEdit: () {},
          onTapDelete: () {},
        )),

    DataCell(
        TextFieldWidget(
          height: size.height * 0.07,
          width: size.width * 0.6,
          hintText: 'hhh',
          hintStyle: AppStyles.styleRegular14(context)
              .copyWith(color: Colors.grey.shade300),
          onChanged: (value) {},
          color: Colors.transparent,
        )),
    DataCell(Text('25')),
    DataCell(Text('250')),
    DataCell(Text('الخصم')),
    DataCell(Text('5%')),
    DataCell(Text('الإجمالي')),
    DataCell(
        Center(
          child: TextFieldWidget(
            height: size.height * 0.07,
            width: size.width * 0.6,
            hintText: 'hhh',
            hintStyle: AppStyles.styleRegular14(context)
                .copyWith(color: Colors.grey.shade300),
            onChanged: (value) {},
            color: Colors.transparent,
          ),
        )),
  ]);



}