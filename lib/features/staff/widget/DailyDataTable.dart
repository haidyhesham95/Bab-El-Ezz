import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared_utils/styles/text.dart';
import '../../../shared_utils/utils/widget/button_widget.dart';
import 'package:flutter/material.dart';

import '../../../shared_utils/utils/widget/drop_menu.dart';
import '../../new_job-order/widgets/drop_button.dart';
import '../manager/daily_table/daily_table_cubit.dart';

class DailyDataTable extends StatelessWidget {
  const DailyDataTable({Key? key,required this.onPressed}) : super(key: key);
final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return  Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              child: CustomDataTable(
                columns: [
                  DataColumn(
              label:IconButton(
                      onPressed: onPressed,
                      icon: Icon(Icons.add, color: Colors.white, size: 20,))),
                  const DataColumn(label: Text(' اسم الفني ')),
                  const DataColumn(label: Text(' عمل/اجازة ')),
                  const DataColumn(label: Text(' وقت الحضور ')),
                  const DataColumn(label: Text(' وقت االانصراف ')),
                  const DataColumn(label: Text(' مكافأة ')),
                  const DataColumn(label: Text(' خصم ')),
                  const DataColumn(label: Text(' سلفة-مصروف ')),
                  const DataColumn(label: Text(' ملاحظات ')),
                  const DataColumn(label: Text(' تصفية حساب ')),
                ],
                rows: List.generate( 1,
                      (index) => DataRow(
                    cells: <DataCell>[
                      DataCell(
                          DropMenu(
                            onTapEdit: () {},
                            onTapDelete: () {},
                          )),

                      DataCell(Text('dfddh')),

                        DataCell(Text('dfddh')),

                      DataCell(Text('dfddh')),
                      DataCell(Text('dfddh')),
                      DataCell(Text('dfddh')),
                      DataCell(Text('dfddh')),
                      DataCell(Text('dfddh')),
                      DataCell(Text('dfddh')),
                      DataCell(
                        ButtonWidget(
                          height: 25,
                          onPressed: () {
                            Navigator.of(context).pushNamed('accountClearancePage');
                          },
                          text: 'تصفية حساب',
                          fontStyle: AppStyles.styleSemiBold12(context).copyWith(color: Colors.white),
                          borderRadius: 4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );

  }
}
