import 'package:bab_el_ezz/shared_utils/utils/widget/data_text_field.dart';
import 'package:flutter/material.dart';

import '../../../../shared_utils/utils/widget/drop_menu.dart';

/// if controllers > 1, then it's a data row not input row
///
/// controllers = [name, quantity, discount, service, notes]
DataRow addInvoiceSpareRowTable(
  List<TextEditingController> controllers, {
  Function()? onAddPressed,
  double price = 0,
  bool footer = false,
}) {
  bool dataRow = controllers[1].text.isNotEmpty;
  if (dataRow && controllers.length != 5) {
    throw Exception("Controllers must be length of 5");
  }

  return DataRow(
    cells: <DataCell>[
      DataCell(footer
          ? IconButton(
              onPressed: onAddPressed,
              icon: const Icon(
                Icons.add,
                color: Colors.white,
                size: 20,
              ))
          : DropMenu(
              onTapEdit: (index) {},
              onTapDelete: (index) {},
            )),
      DataCell(dataRow
          ? Text(controllers[0].text)
          : DataTextField(
              controller: controllers[0],
              hintText: 'اضافه صنف',
            )),
      DataCell(dataRow
          ? Text(controllers[1].text)
          : DataTextField(
              controller: controllers[0],
              hintText: 'اضافه كمية',
            )),
      DataCell(Text(dataRow ? price.toString() : '--')),
      DataCell(dataRow
          ? Text(controllers[2].text)
          : DataTextField(
              controller: controllers[0],
              hintText: 'اضافه خصم',
            )),
      DataCell(dataRow
          ? Text(controllers[3].text)
          : DataTextField(
              controller: controllers[0],
              hintText: 'اضافه المصنعية',
            )),
      DataCell(Text(dataRow
          ? ((price * double.parse(controllers[1].text)) -
                  double.parse(controllers[2].text))
              .toString()
          : '--')),
      DataCell(dataRow
          ? Text(controllers[4].text)
          : DataTextField(
              controller: controllers[0],
              hintText: 'اضافه ملاحظات',
            )),
    ],
  );
}
