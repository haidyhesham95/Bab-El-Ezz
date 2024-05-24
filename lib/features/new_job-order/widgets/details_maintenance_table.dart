import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';
import 'package:flutter/material.dart';



class DetailsMaintenanceTable extends StatelessWidget {
  const DetailsMaintenanceTable({super.key,});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: CustomDataTable(
      //  horizontalMargin: 75,
        columnSpacing: 90,
          columns: [
            const DataColumn(label: Text('الصنف')),
            const DataColumn(label: Text('الكمية')),
            const DataColumn(label: Text('المصنعية')),
         ],


          rows: List.generate(
            3,
                (index) => DataRow(
                cells: <DataCell>[


                  const DataCell(Text('-------')),
                  const DataCell(Text('5')),

                  const DataCell(Text('----')),


                ]
            ),
          )),
    );
  }

}
