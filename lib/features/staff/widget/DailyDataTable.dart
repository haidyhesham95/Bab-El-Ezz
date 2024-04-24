import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared_utils/styles/text.dart';
import '../../../shared_utils/utils/widget/button_widget.dart';
import 'package:flutter/material.dart';

import '../../new_job-order/widgets/drop_button.dart';
import '../manager/daily_table/daily_table_cubit.dart';

class DailyDataTable extends StatelessWidget {
  const DailyDataTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DailyTableCubit(),
      child: BlocBuilder<DailyTableCubit, DailyTableState>(
        builder: (context, state) {
          DailyTableCubit cubit = DailyTableCubit.get(context);
          return Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: CustomDataTable(
                  columns: [
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
                  rows: List.generate( 20,
                        (index) => DataRow(
                      cells: <DataCell>[
                        DataCell(Text('dfddh')),
                        DataCell(
                          DropButton(
                            styleValue: AppStyles.styleRegular10(context),
                            color: Colors.white,
                            height: 25,
                            hintText: 'عمل',
                            borderRadius: 0,
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            styleHint: AppStyles.styleSemiBold12(context),
                            iconSize: 12,
                            value: cubit.selectedType,
                            onChanged: (String? value) {
                              cubit.setSelectedType(value);
                            },
                            items: const [
                              DropdownMenuItem(
                                value: 'عمل',
                                child: Text('عمل '),
                              ),
                              DropdownMenuItem(
                                value: 'اجازة',
                                child: Text('اجازة '),
                              ),
                            ],
                          ),
                        ),
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
        },
      ),
    );
  }
}
