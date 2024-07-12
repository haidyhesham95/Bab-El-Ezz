import 'package:bab_el_ezz/data/customer.dart';
import 'package:bab_el_ezz/data/part_customer.dart';
import 'package:bab_el_ezz/features/data%20analysis/view/technical/manager/technical_cubit.dart';
import 'package:bab_el_ezz/features/data%20analysis/view/technical/widget/new_customer_chart.dart';
import 'package:bab_el_ezz/features/data%20analysis/view/technical/widget/technical_cards.dart';
import 'package:bab_el_ezz/features/data%20analysis/view/technical/widget/technical_chart.dart';
import 'package:bab_el_ezz/features/data%20analysis/view/technical/widget/technical_date.dart';
import 'package:bab_el_ezz/features/data%20analysis/view/technical/widget/technical_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../shared_utils/utils/widget/clip_path_gradient.dart';
import '../widget/technical_bar_chart.dart';

class TechnicalAnalysis extends StatelessWidget {
  const TechnicalAnalysis({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: BlocProvider(
        create: (context) => TechnicalCubit(),
        child: BlocBuilder<TechnicalCubit, TechnicalState>(
          builder: (context, state) {
            TechnicalCubit cubit = TechnicalCubit.get(context);

            print("state: $state");
            if (state is TechnicalInitial) {
              cubit.getData();
              cubit.getPartsData();
              return Center(child: CircularProgressIndicator());
            }
            if (state is GetRangeDate) {
              cubit.getData();
              return Center(child: CircularProgressIndicator());
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                TechnicalCards(
                  currentClients: cubit.currentClients,
                  newClients: cubit.newClients,
                  orders: cubit.numOrders,
                ),
                const SizedBox(height: 40),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: TechnicalDetails(cubit.jobOrders)),
                    Expanded(child: TechnicalChart(cubit.jobOrders)),
                    SizedBox(width: 10),
                  ],
                ),
                const SizedBox(height: 20),
                clipBathGradient(context, text: 'العملاء الجدد '),
                const SizedBox(height: 30),
                NewCustomerChart(
                    monthlyData: _countNewPerMonth(cubit.customersList.map((e) {
                  final data = e.data();
                  print("data: $data");
                  return data is Customer
                      ? data.created?.month ?? 0
                      : (data as PartCustomer).created?.month ?? 0;
                }).toList())),
                const SizedBox(height: 25),
                clipBathGradient(context,
                    text: 'قطع الغيار / الاكثر استخداما '),
                const SizedBox(height: 30),
                TechnicalBarChart(cubit.partUsageCounts),
                const SizedBox(height: 25),
              ],
            );
          },
        ),
      ),
    ));
  }

  /// list of user created months [1..12] (length unknown)
  List<int> _countNewPerMonth(List<int> list) {
    DateTime now = DateTime.now();
    List<int> ret = List.generate(12, (index) => 0);
    list.forEach((e) {
      print("month: $e");
      // if month == 0, then created is null
      if (e != 0) {
        ret[(e - now.month) % 12]++;
      }
    });
    return ret;
  }
}
