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
        body: BlocProvider(
          create: (context) => EmployeeCubit(),
          child: BlocBuilder<EmployeeCubit, EmployeeState>(
            builder: (context, state) {
              EmployeeCubit cubit = EmployeeCubit.get(context);

              if (state is EmployeeInitial) {
                cubit.getTechs();
                return const Center(child: CircularProgressIndicator());
              }

              if (state is GetRangeDate) {
                cubit.getTechs();
                return const Center(child: CircularProgressIndicator());
              }

              return CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 30,
                    ),),
                  SliverToBoxAdapter(
                    child: TechnicalDate(
                      text: cubit.selectedRange == null
                          ? ' اختر التاريخ من - إلى '
                          : ' من : ${DateFormat('yyyy-MM-dd').format(cubit.selectedRange!.start)}  -  الي : ${DateFormat('yyyy-MM-dd').format(cubit.selectedRange!.end)} ',
                      onTap: () {
                        cubit.getDateRange(context);
                      },
                    ),),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 30,
                    ),),
                  SliverToBoxAdapter(
                    child:  EmployeeBarChart(cubit.techCars),),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 10,
                    ),),
                  SliverAppBar(
                    pinned: true,
                    expandedHeight: 50,
                    collapsedHeight: 80,
                    flexibleSpace:EmployeeChartDetails(cubit.jobOrders),
                  ),
                  SliverToBoxAdapter(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: cubit.techCars.keys.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                cubit.techCars.keys.elementAt(index),
                                style: const TextStyle(fontSize: 20),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 70.0),
                                child: EmployeeChart(
                                  jobOrders: cubit.jobOrders
                                      .where((e) => (e.technicians
                                      ?.map((e) => e.name)
                                      .toList()
                                      .contains(cubit.techCars.keys
                                      .elementAt(index)) ??
                                      false))
                                      .toList(),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),),

                ],
              );

            },
          ),
        ));
  }
}
