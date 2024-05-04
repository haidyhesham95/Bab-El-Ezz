
import 'package:flutter/material.dart';
import 'package:bab_el_ezz/shared_utils/styles/colors.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';
import '../../../../shared_utils/styles/text.dart';
import '../../../../shared_utils/utils/widget/add_icon_button.dart';
import '../../../../shared_utils/utils/widget/button_widget.dart';
import '../../../../shared_utils/utils/widget/drop_menu.dart';

class MerchantReturnedTable extends StatelessWidget {
  const MerchantReturnedTable({super.key,});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: CustomDataTable(
          columns: [

            DataColumn(label: addIconButton(context,(){
              Navigator.pushNamed(context, 'addMerchantReturnedData');

            })),
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
                DataCell(Text('dfdd')),
                DataCell(Text('hhhhhh')),
                DataCell(Text('dfdd')),
                DataCell(Text('dfdd')),
                DataCell(Text('dfdd')),
                DataCell(Text('dfdd')),

              ],
            ),
          )),


    );
  }
}