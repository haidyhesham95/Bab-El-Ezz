import 'package:bab_el_ezz/features/data%20analysis/view/employee_performance/manager/employee_cubit.dart';
import 'package:bab_el_ezz/features/data%20analysis/view/employee_performance/widget/employee_bar_chart.dart';
import 'package:bab_el_ezz/features/data%20analysis/view/employee_performance/widget/employee_chart.dart';
import 'package:bab_el_ezz/features/data%20analysis/view/employee_performance/widget/employee_chart_details.dart';
import 'package:bab_el_ezz/features/data%20analysis/view/technical/widget/technical_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class EmployeePerformance extends StatelessWidget {
  const EmployeePerformance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: BlocProvider(
        create: (context) => EmployeeCubit(),
        child: BlocBuilder<EmployeeCubit, EmployeeState>(
          builder: (context, state) {
            EmployeeCubit cubit = EmployeeCubit.get(context);

            if (state is EmployeeInitial) {
              cubit.getTechs();
              return Center(child: CircularProgressIndicator());
            }

            if (state is GetRangeDate) {
              cubit.getTechs();
              return Center(child: CircularProgressIndicator());
            }

            return Column(
              children: [
                const SizedBox(height: 30),
                TechnicalDate(
                  text: cubit.selectedRange == null
                      ? ' اختر التاريخ من - إلى '
                      : ' من : ${DateFormat('yyyy-MM-dd').format(cubit.selectedRange!.start)}  -  الي : ${DateFormat('yyyy-MM-dd').format(cubit.selectedRange!.end)} ',
                  onTap: () {
                    cubit.getDateRange(context);
                  },
                ),
                const SizedBox(height: 30),
                EmployeeBarChart(cubit.techCars),
                const SizedBox(height: 50),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: EmployeeChartDetails(cubit.techCars)),
                    Expanded(child: EmployeeChart()),
                    SizedBox(width: 10),
                  ],
                ),
                SizedBox(
                  height: 20,
                )
              ],
            );
          },
        ),
      ),
    ));
  }
}
