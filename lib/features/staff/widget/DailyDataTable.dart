import 'package:bab_el_ezz/data/technician.dart';
import 'package:bab_el_ezz/features/staff/widget/time_picker.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/data_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared_utils/styles/colors.dart';
import '../../../shared_utils/styles/text.dart';
import '../../../shared_utils/utils/widget/button_widget.dart';
import '../../new_job-order/widgets/drop_button.dart';
import '../manager/daily_table/daily_table_cubit.dart';

class DailyDataTable extends StatelessWidget {
  const DailyDataTable({
    Key? key,
    required this.technicians,
  }) : super(key: key);

  final List<Technician> technicians;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => DailyTableCubit(technicians),
      child: BlocConsumer<DailyTableCubit, DailyTableState>(
        listener: (context, state) {},
        builder: (context, state) {
          DailyTableCubit cubit = DailyTableCubit.get(context);
          return Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  child: CustomDataTable(
                    columns: const [
                      DataColumn(
                        label: Text('مسلسل'),
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
                      technicians.length,
                      (index) => DataRow(cells: <DataCell>[
                        DataCell(Center(
                          child: Text((index + 1).toString()),
                        )),
                        DataCell(
                          Text(technicians[index].name),
                        ),
                        DataCell(
                          DropButton(
                            width: size.width * 0.3,
                            styleHint: AppStyles.styleRegular14(context)
                                .copyWith(color: ColorsAsset.kDarkBrown),
                            height: size.height * 0.045,
                            color: Colors.white,
                            hintText: 'عمل/اجازة',
                            iconSize: 18,
                            value: cubit.statusList[index],
                            onChanged: (String? value) {
                              cubit.setSelectedType(value, index);
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
                        DataCell(timePicker(
                            context,
                            cubit.checkIns[index]?.format(context) ?? "--",
                            cubit.setAttendanceTime)),
                        DataCell(timePicker(
                            context,
                            cubit.checkOuts[index]?.format(context) ?? "--",
                            cubit.setCheckOutTime)),
                        DataCell(DataTextField(
                          hintText: 'مكافأة',
                          controller: cubit.bonusController[index],
                        )),
                        DataCell(DataTextField(
                          hintText: 'خصم',
                          controller: cubit.deductionController[index],
                        )),
                        DataCell(DataTextField(
                          hintText: 'سلفة/مصروف',
                          controller: cubit.advanceController[index],
                        )),
                        DataCell(
                          DataTextField(
                            hintText: 'اضافه ملاحظه',
                            controller: cubit.noteController[index],
                          ),
                        ),
                        DataCell(
                          ButtonWidget(
                            height: 25,
                            onPressed: () async {
                              Technician tec = technicians[index];
                              await Navigator.of(context).pushNamed(
                                  'accountClearancePage',
                                  arguments: [
                                    tec.id,
                                    tec.lastPayment,
                                    tec.dailyRate
                                  ]);
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
              Center(
                child: ButtonWidget(
                  height: 35,
                  margin: const EdgeInsets.all(25),
                  onPressed: () {
                    cubit.submitDailyData();
                  },
                  fontStyle: AppStyles.styleSemiBold12(context)
                      .copyWith(color: Colors.white),
                  borderRadius: 4,
                  text: 'إنهاء اليوم',
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
