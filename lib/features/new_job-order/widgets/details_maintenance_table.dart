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
          columns: const [
            DataColumn(label: Text('الصنف')),
            DataColumn(label: Text('الكمية')),
            DataColumn(label: Text('المصنعية')),
         ],


          rows: List.generate(
            3,
                (index) => const DataRow(
                cells: <DataCell>[


                  DataCell(Text('-------')),
                  DataCell(Text('5')),

                  DataCell(Text('----')),


                ]
            ),
          )),
    );
  }

}
