import 'package:bab_el_ezz/shared_utils/utils/widget/data_text_field.dart';
import 'package:flutter/material.dart';

import '../../../shared_utils/utils/widget/drop_menu.dart';

DataRow tableItem(BuildContext context) {
  final size = MediaQuery.of(context).size;
  return DataRow(cells: [
    DataCell(DropMenu(
      onTapEdit: (index) {},
      onTapDelete: (index) {},
    )),
    const DataCell(
      DataTextField(
        hintText: 'اضافه صنف',
      ),
    ),
    const DataCell(Text('25')),
    const DataCell(Text('250')),
    const DataCell(Text('الخصم')),
    const DataCell(
      DataTextField(
        hintText: 'اضافه مصنعية',
      ),
    ),
    const DataCell(Text('الإجمالي')),
    const DataCell(DataTextField(
      hintText: 'اضافه ملاحظه',
    )),
  ]);
}
