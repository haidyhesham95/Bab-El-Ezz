import 'package:flutter/material.dart';
import '../../../../shared_utils/utils/widget/add_icon_button.dart';
import '../../../../shared_utils/utils/widget/custom_data_table.dart';
import '../../../../shared_utils/utils/widget/drop_menu.dart';

class SupplierTable extends StatelessWidget {
  const SupplierTable({super.key,required this.showAllDataSuppliers});
 final bool showAllDataSuppliers ;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: CustomDataTable(
        columns: [
          DataColumn(label: Container(
            margin: const EdgeInsets.all(5),
            child: addIconButton(context,(){
              Navigator.pushNamed(context, 'addSuppliersData');

            }),
          )),
    if (showAllDataSuppliers) ...[

    const DataColumn(label: Text('مسلسل')),
          ],
          const DataColumn(label: Text('الاسم')),
          const DataColumn(label: Text('رقم التليفون')),
          const DataColumn(label: Text('اسم الشركة')),
    if (showAllDataSuppliers) ...[

    const DataColumn(label: Text('عدد الفواتير')),
          const DataColumn(label: Text('اجمالي الفواتير')),
          const DataColumn(label: Text('اجمالي المدفوع')),
          ],
          const DataColumn(label: Text('اجمالي المتبقي')),
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
        if (showAllDataSuppliers) ...[

    const DataCell(Text('dfdd')),
                ],

                const DataCell(Text('hhh')),
              const DataCell(Text('dfdd')),
              const DataCell(Text('dfdd')),
    if (showAllDataSuppliers) ...[


    const DataCell(Text('dfdd')),
              const DataCell(Text('dfdd')),
              const DataCell(Text('dfdd')),
              ],

              const DataCell(Text('---')),

            ],
          ),
        ),

      ),
    );
  }
}
