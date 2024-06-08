import 'package:bab_el_ezz/features/invoices/invoices/widget/top_invoice_search.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';
import 'package:flutter/material.dart';

import '../../../../shared_utils/utils/widget/add_icon_button.dart';
import '../../../../shared_utils/utils/widget/drop_menu.dart';

class MerchantReturnedTable extends StatelessWidget {
  const MerchantReturnedTable({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        TopInvoicesSearch(
          onPressedSearch: () {},
          text: ' مرتجع التجار / الموردين',
          height: 70,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: CustomDataTable(
              columns: [
                DataColumn(label: AddIconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'addMerchantReturnedData');
                  },
                )),
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
                    DataCell(DropMenu(
                      onTapEdit: (index) {},
                      onTapDelete: (index) {},
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
        ),
      ],
    );
  }
}
