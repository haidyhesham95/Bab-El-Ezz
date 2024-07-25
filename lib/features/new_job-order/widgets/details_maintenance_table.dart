import 'package:bab_el_ezz/data/part.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';
import 'package:flutter/material.dart';

class DetailsMaintenanceTable extends StatelessWidget {
  DetailsMaintenanceTable(
    this.parts, {
    super.key,
  });

  List<Part> parts;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: CustomDataTable(
          //  horizontalMargin: 75,
          columnSpacing: 90,
          columns: const [
            DataColumn(label: Text('الصنف')),
            DataColumn(label: Text('الكمية')),
            DataColumn(label: Text('السعر')),
          ],
          rows: List.generate(
            parts.length,
            (index) => DataRow(cells: <DataCell>[
              DataCell(Text(parts[index].name)),
              DataCell(Text(parts[index].quantity.toString())),
              DataCell(Text(parts[index].sellingPrice.toString())),
            ]),
          )),
    );
  }
}
