import 'package:flutter/material.dart';
import '../../../shared_utils/styles/colors.dart';
import '../../../shared_utils/styles/text.dart';
import '../../../shared_utils/utils/widget/button_widget.dart';



DataRow itemStaffTable(context , dynamic Function()? onPressed) {
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
      DataCell(ButtonWidget(
        height: 25,
        onPressed: () {
          Navigator.of(context).pushNamed('accountClearancePage');
        },
        text: 'تصفية حساب',
        fontStyle: AppStyles.styleSemiBold12(context).copyWith(color: Colors.white),
        borderRadius: 4,
      ),),
    ],
  );
}