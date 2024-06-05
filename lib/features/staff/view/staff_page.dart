import 'package:bab_el_ezz/data/technician.dart';
import 'package:bab_el_ezz/features/staff/widget/daily_table.dart';
import 'package:bab_el_ezz/features/staff/widget/staff_data_table.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/floating_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared_utils/utils/widget/appbar_widget.dart';
import '../manager/staff/staff_cubit.dart';
import '../widget/toggle_button.dart';

class StaffPage extends StatelessWidget {
  StaffPage({Key? key}) : super(key: key);

  late StaffCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: floatingButton(
        context: context,
        onPressed: () async {
          final technician = await Navigator.of(context)
              .pushNamed('addStaffItem') as Technician;
          cubit.updateTechnicians(technician);
        },
        text: 'اضافة عامل',
      ),
      appBar: appBarWidget(context),
      body: Center(
        child: BlocProvider(
          create: (context) => StaffCubit(),
          child: BlocBuilder<StaffCubit, StaffState>(
            builder: (context, state) {
              cubit = StaffCubit.get(context);
              if (state is StaffInitial) {
                cubit.getTechnicians();
                // cubit.getAttendances();
                return const CircularProgressIndicator();
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  ToggleButton(
                    selectedIndex: cubit.selectedIndex,
                    onPressed: (index) {
                      cubit.changeIndex(index);
                    },
                  ),
                  Visibility(
                    visible: cubit.selectedIndex == 0,
                    child: Expanded(
                      child: DailyTable(
                        technicians: cubit.technicians,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: cubit.selectedIndex == 1,
                    child: Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 50,
                                ),
                                StaffDataTable(
                                  technicians: cubit.technicians,
                                  onEdit: (index) async {
                                    print("edit");
                                    final technician =
                                        await Navigator.of(context).pushNamed(
                                            'addStaffItem',
                                            arguments: cubit.technicians[index]
                                                .toJson()) as Technician;
                                    cubit.updateTechnicians(technician,
                                        update: true);
                                  },
                                  onDelete: (index) {
                                    print("index: $index");
                                    cubit.deleteTechnician(
                                        cubit.technicians[index]);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
