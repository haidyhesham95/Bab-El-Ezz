import 'package:flutter/material.dart';
import '../../../shared_utils/styles/colors.dart';
import '../../../shared_utils/styles/text.dart';
import '../../../shared_utils/utils/widget/button_widget.dart';
import '../../../shared_utils/utils/widget/drop_menu.dart';



DataRow itemStaffTable(context , dynamic Function()? onPressed) {
  return DataRow(
    cells: [
          DataCell(
              DropMenu(
                onTapEdit: () {},
                onTapDelete: () {},
              )),
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
        text: 'عرض التفاصيل',
        fontStyle: AppStyles.styleSemiBold12(context).copyWith(color: Colors.white),
        borderRadius: 4,
      ),),
    ],
  );
}