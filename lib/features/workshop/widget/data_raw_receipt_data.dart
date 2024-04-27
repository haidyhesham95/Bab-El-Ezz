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
          TextFieldWidget(
            height: size.height * 0.05,
            width: size.width * 0.6,
            hintText: 'hhh',
            hintStyle: AppStyles.styleRegular14(context)
                .copyWith(color: Colors.grey.shade300),
            onChanged: (value) {},
            color: Colors.transparent,
          )),      DataCell(Text('50000')),
      DataCell(Text('1200')),
      DataCell(
          TextFieldWidget(
            height: size.height * 0.05,
            width: size.width * 0.6,
            hintText: 'hhh',
            hintStyle: AppStyles.styleRegular14(context)
                .copyWith(color: Colors.grey.shade300),
            onChanged: (value) {},
            color: Colors.transparent,
          )),      DataCell(Text('1200')),
    ],
  );
}