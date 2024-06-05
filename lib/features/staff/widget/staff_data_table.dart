import 'package:bab_el_ezz/data/technician.dart';
import 'package:bab_el_ezz/features/staff/manager/staff/staff_cubit.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared_utils/styles/text.dart';
import '../../../shared_utils/utils/widget/button_widget.dart';
import '../../../shared_utils/utils/widget/drop_menu.dart';

class StaffDataTable extends StatelessWidget {
  const StaffDataTable(
      {super.key,
      required this.technicians,
      required this.onEdit,
      required this.onDelete});

  final List<Technician> technicians;
  final void Function(int) onEdit;
  final void Function(int) onDelete;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StaffCubit(),
      child: BlocBuilder<StaffCubit, StaffState>(
        builder: (context, state) {
          StaffCubit cubit = StaffCubit.get(context);
          if (state is StaffInitial) {
            cubit.getTechnicians();
            return CircularProgressIndicator();
          }
          return CustomDataTable(
            columns: const [
              DataColumn(label: Text('')),
              DataColumn(label: Text(' اسم الفني ')),
              DataColumn(label: Text(' الرقم القومي ')),
              DataColumn(label: Text(' التخصص ')),
              DataColumn(label: Text(' الدرجة الوظيفية ')),
              DataColumn(label: Text(' القيمة اليومية ')),
              DataColumn(label: Text('التفاصيل ')),
            ],
            rows: List.generate(
              cubit.technicians.length,
              (index) => DataRow(
                cells: <DataCell>[
                  DataCell(DropMenu(
                    onTapEdit: (index) => onEdit(index),
                    onTapDelete: (index) => onDelete(index),
                    index: index,
                  )),
                  DataCell(Text(cubit.technicians[index].name)),
                  DataCell(Text(cubit.technicians[index].nationalId)),
                  DataCell(Text(cubit.technicians[index].specialization)),
                  DataCell(Text(cubit.technicians[index].title)),
                  DataCell(Text(cubit.technicians[index].dailyRate.toString())),
                  DataCell(
                    ButtonWidget(
                      height: 25,
                      onPressed: () async {
                        Navigator.of(context)
                            .pushNamed('viewDetailsPage', arguments: [
                          cubit.technicians[index].name,
                          cubit.technicians[index].id,
                          cubit.technicians[index].lastPayment
                        ]);
                      },
                      text: 'عرض التفاصيل',
                      fontStyle: AppStyles.styleSemiBold12(context)
                          .copyWith(color: Colors.white),
                      borderRadius: 4,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
