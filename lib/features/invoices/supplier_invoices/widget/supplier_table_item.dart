
import 'package:flutter/material.dart';

import '../../../../shared_utils/styles/colors.dart';
import '../../../../shared_utils/styles/text.dart';
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
          TextFieldWidget(
            height: size.height * 0.05,
            width: size.width * 0.6,
            hintText: 'هايدي',
            hintStyle: AppStyles.styleRegular14(context)
                .copyWith(color: Colors.grey.shade300),
            onChanged: (value) {},
            color: Colors.transparent,
          )),
      DataCell(
          TextFieldWidget(
            height: size.height * 0.05,
            width: size.width * 0.6,
            hintText: '0111',
            hintStyle: AppStyles.styleRegular14(context)
                .copyWith(color: Colors.grey.shade300),
            onChanged: (value) {},
            color: Colors.transparent,
          )),
      DataCell(
          TextFieldWidget(
            height: size.height * 0.05,
            width: size.width * 0.6,
            hintText: 'name',
            hintStyle: AppStyles.styleRegular14(context)
                .copyWith(color: Colors.grey.shade300),
            onChanged: (value) {},
            color: Colors.transparent,
          )),
      DataCell(Text('dfdd')),
      DataCell(Text('dfdd')),
      DataCell(Text('dfdd')),
      DataCell(Text('---')),


    ],
  );
}