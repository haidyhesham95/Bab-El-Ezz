
import 'package:flutter/material.dart';

import '../../../shared_utils/styles/colors.dart';
import '../../../shared_utils/styles/text.dart';

DataRow supplierTableItem(context , dynamic Function()? onPressed) {
  return DataRow(
    cells: [
      DataCell(
          TextButton(
              onPressed: onPressed,
              child: Text('...',style: AppStyles.styleSemiBold20(context).copyWith(color: ColorsAsset.kGreen),))),
      DataCell(Text('dfdd')),
      DataCell(Text('hhhhhh')),
      DataCell(Text('dfdd')),
      DataCell(Text('dfdd')),
      DataCell(Text('dfdd')),
      DataCell(Text('dfdd')),
      DataCell(Text('dfdd')),
      DataCell(Text('---')),


    ],
  );
}