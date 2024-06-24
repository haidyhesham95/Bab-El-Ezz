import 'package:bab_el_ezz/shared_utils/utils/widget/data_text_field.dart';
import 'package:flutter/material.dart';

import '../../../../shared_utils/utils/widget/drop_menu.dart';

/// if controllers is not empty, then it's a data row not input row
///
/// controllers = [name, quantity, price, notes]
DataRow addInvoiceSpareRowTable(
  List<TextEditingController> controllers, {
  Function()? onAddPressed,
  bool footer = false,
  bool discount = false,
  bool total = false,
}) {
  bool dataRow = controllers[1].text.isNotEmpty;

  if (dataRow &&
      controllers.length != 4 &&
      controllers.indexed
          //name, quantity and price are mandatory.
          .where((element) =>
              element.$1 == 0 || element.$1 == 1 || element.$1 == 2)
          .every((element) => element.$2.text.isNotEmpty)) {
    throw Exception("All data must be filled");
  }
  double price =
      controllers[2].text.isEmpty ? 0 : double.parse(controllers[2].text);

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
          : (discount || total
              ? Container()
              : DropMenu(
                  onTapEdit: (index) {},
                  onTapDelete: (index) {},
                ))),
      DataCell(dataRow
          ? Text(total ? "اﻹجمالي" : controllers[0].text)
          : (discount || total
              ? Text(discount ? "الخصم" : "اﻹجمالي")
              : DataTextField(
                  controller: controllers[0],
                  hintText: 'اضافه صنف',
                ))),
      DataCell(discount || total
          ? Container()
          : dataRow
              ? Text(controllers[1].text)
              : DataTextField(
                  controller: controllers[1],
                  hintText: 'اضافه كمية',
                )),
      DataCell(dataRow || total
          ? Text(price.toString())
          : DataTextField(
              controller: controllers[2],
              hintText: 'اضافه سعر',
            )),
      DataCell(dataRow
          ? Text(controllers[3].text)
          : DataTextField(
              controller: controllers[3],
              hintText: 'اضافه ملاحظات',
            )),
    ],
  );
}
