
import 'package:flutter/material.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';
import '../../../../shared_utils/utils/widget/add_icon_button.dart';
import '../../../../shared_utils/utils/widget/drop_menu.dart';

class CustomerReturnedTable extends StatelessWidget {
  const CustomerReturnedTable({super.key,});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: CustomDataTable(
          columns: [
            DataColumn(label: AddIconButton(onPressed: (){Navigator.pushNamed(context, 'addCustomerReturnedData');},  )),



            const DataColumn(label: Text('مسلسل')),
            const DataColumn(label: Text('الصنف')),
            const DataColumn(label: Text('الكمية')),
            const DataColumn(label: Text('السعر')),
            const DataColumn(label: Text('الحالة')),
            const DataColumn(label: Text('المالحظات')),

          ],
          rows: List.generate(
            2,
                (index) => DataRow(
              cells: <DataCell>[
                DataCell(
                    DropMenu(
                      onTapEdit: () {},
                      onTapDelete: () {},
                    )),
                const DataCell(Text('dfdd')),
                const DataCell(Text('hhhhhh')),
                const DataCell(Text('dfdd')),
                const DataCell(Text('dfdd')),
                const DataCell(Text('dfdd')),
                const DataCell(Text('dfdd')),

              ],
            ),
          )),


    );
  }
}