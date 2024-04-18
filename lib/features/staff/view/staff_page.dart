import 'package:bab_el_ezz/features/staff/widget/daily_table.dart';
import 'package:bab_el_ezz/features/staff/widget/staff_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared_utils/utils/widget/appbar_widget.dart';
import '../manager/staff/staff_cubit.dart';
import '../widget/toggle_button.dart';

class StaffPage extends StatelessWidget {
  const StaffPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context),
      body: Center(
        child: BlocProvider(
          create: (context) => StaffCubit(),
          child: BlocBuilder<StaffCubit, StaffState>(
            builder: (context, state) {
            StaffCubit cubit = StaffCubit.get(context);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                TableButton(
                  selectedIndex: cubit.selectedIndex,
                   onPressed:
                      (index) {
                        cubit.changeIndex(index);
                      },

                ),
                Visibility(
                  visible: cubit.selectedIndex == 0,
                  child: Expanded(
                    child: DailyTable(),
                  ),
                ),
                Visibility(
                  visible: cubit.selectedIndex == 1,
                  child: Expanded(
                    child: StaffTable(),
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

