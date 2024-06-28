import 'package:bab_el_ezz/features/data%20analysis/view/employee_performance/manager/employee_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../shared_utils/styles/colors.dart';
import '../../../../../shared_utils/styles/text.dart';
import '../../../../../shared_utils/utils/widget/row_text.dart';
import '../../../../new_job-order/widgets/gray_container.dart';

class EmployeeDate extends StatelessWidget {
  const EmployeeDate({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => EmployeeCubit(),
      child: BlocBuilder<EmployeeCubit, EmployeeState>(
        builder: (context, state) {
          EmployeeCubit cubit = EmployeeCubit.get(context);
          return InkWell(
            onTap: ()  {
              cubit.getDateRange(context);
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: ColorsAsset.kGreen),
              ),
              child: Center(
                child: Text(
                  cubit.selectedRange == null
                      ? ' اختر التاريخ من - إلى '
                      : ' من : ${DateFormat('yyyy-MM-dd').format(cubit.selectedRange!.start)}  -  الي : ${DateFormat('yyyy-MM-dd').format(cubit.selectedRange!.end)} ',
                  style: AppStyles.styleMedium16(context),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

}
