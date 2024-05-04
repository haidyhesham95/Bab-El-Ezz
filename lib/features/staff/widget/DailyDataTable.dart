import 'package:bab_el_ezz/features/staff/widget/time_picker.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/data_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared_utils/styles/colors.dart';
import '../../../shared_utils/styles/text.dart';
import '../../../shared_utils/utils/widget/button_widget.dart';
import 'package:flutter/material.dart';

import '../../../shared_utils/utils/widget/drop_menu.dart';
import '../../new_job-order/widgets/drop_button.dart';
import '../manager/daily_table/daily_table_cubit.dart';

class DailyDataTable extends StatelessWidget {
  const DailyDataTable({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => DailyTableCubit(),
      child: BlocConsumer<DailyTableCubit, DailyTableState>(
        listener: (context, state) {},
        builder: (context, state) {
          DailyTableCubit cubit = DailyTableCubit.get(context);
          return Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: CustomDataTable(
                  columns: const [
                    DataColumn(
                      label: Text(''),
                    ),
                    DataColumn(label: Text(' اسم الفني ')),
                    DataColumn(label: Text(' عمل/اجازة ')),
                    DataColumn(label: Text(' وقت الحضور ')),
                    DataColumn(label: Text(' وقت االانصراف ')),
                    DataColumn(label: Text(' مكافأة ')),
                    DataColumn(label: Text(' خصم ')),
                    DataColumn(label: Text(' سلفة-مصروف ')),
                    DataColumn(label: Text(' ملاحظات ')),
                    DataColumn(label: Text(' تصفية حساب ')),
                  ],
                  rows: List.generate(
                    2,
                        (index) => DataRow(cells: <DataCell>[
                      DataCell(DropMenu(
                        onTapEdit: () {},
                        onTapDelete: () {},
                      )),
                      DataCell(
                        DataTextField(
                          hintText: 'اضاقه الفني',
                          controller: cubit.nameController,
                        ),
                      ),
                      DataCell(
                        DropButton(
                          width: size.width * 0.3,
                          styleHint: AppStyles.styleRegular14(context)
                              .copyWith(color: ColorsAsset.kDarkBrown),
                          height: size.height * 0.045,
                          color: Colors.white,
                          hintText: 'عمل',
                          iconSize: 18,
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
                      DataCell(
                          timePicker(context, cubit.AttendanceTime != null
                              ? cubit.AttendanceTime!
                              : 'اختيار الوقت',
                              cubit.setAttendanceTime
                          )),



                      DataCell(timePicker(context, cubit.CheckOutTime != null ? cubit.CheckOutTime!: 'اختيار الوقت',
                        cubit.setCheckOutTime

                      )),
                      const DataCell(Text('dfddh')),
                      const DataCell(Text('dfddh')),
                      const DataCell(Text('dfddh')),
                      DataCell(
                        DataTextField(
                          hintText: 'اضافه ملاحظه',
                          controller: cubit.noteController,
                        ),
                      ),
                      DataCell(
                        ButtonWidget(
                          height: 25,
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed('accountClearancePage');
                          },
                          text: 'تصفية حساب',
                          fontStyle: AppStyles.styleSemiBold12(context)
                              .copyWith(color: Colors.white),
                          borderRadius: 4,
                        ),
                      ),
                    ]),
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
