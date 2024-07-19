import 'package:bab_el_ezz/features/data%20analysis/view/financial/manager/financial_cubit.dart';
import 'package:bab_el_ezz/features/data%20analysis/view/financial/widget/financial_cards.dart';
import 'package:bab_el_ezz/features/data%20analysis/view/financial/widget/net_profit.dart';
import 'package:bab_el_ezz/features/data%20analysis/view/financial/widget/revenues_details.dart';
import 'package:bab_el_ezz/features/data%20analysis/view/technical/widget/technical_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../shared_utils/utils/widget/clip_path_gradient.dart';
import '../widget/revenues_chart.dart';
import '../widget/total_chart.dart';
import '../widget/total_details.dart';
import '../widget/total_store.dart';

class FinancialAccounts extends StatefulWidget {
  const FinancialAccounts({super.key});

  @override
  State<FinancialAccounts> createState() => _FinancialAccountsState();
}

class _FinancialAccountsState extends State<FinancialAccounts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: BlocProvider(
            create: (context) => FinancialCubit(),
            child: BlocBuilder<FinancialCubit, FinancialState>(
              builder: (context, state) {
                FinancialCubit cubit = FinancialCubit.get(context);

                if (state is FinancialInitial) {
                  cubit.populateData();
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
                    Padding(
                      padding: EdgeInsets.only(
                        right: 5,
                        left: 5,
                      ),
                      child: FinancialCards(
                          cubit.net, cubit.storePrice, cubit.remaining),
                    ),
                    const SizedBox(height: 30),
                    clipBathGradient(context, text: 'الإيرادات '),
                    const SizedBox(height: 30),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: RevenuesDetails(
                          service: cubit.services,
                          parts: cubit.spareParts,
                        )),
                        Expanded(
                            child: RevenuesChart(
                          service: cubit.services,
                          parts: cubit.spareParts,
                        )),
                        SizedBox(width: 10),
                      ],
                    ),
                    const SizedBox(height: 20),
                    clipBathGradient(context, text: 'اجمالي المصروفات '),
                    const SizedBox(height: 30),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(child: TotalDetails()),
                        Expanded(
                            child: TotalChart(
                          salaries: cubit.salaries,
                          dailyExpenses: cubit.dailyExpenses,
                          merchantInvoices: cubit.merchantInvoices,
                        )),
                        SizedBox(width: 10),
                      ],
                    ),
                    const SizedBox(height: 25),
                    clipBathGradient(context, text: 'اجمالي رصيد المخزن '),
                    const SizedBox(height: 30),
                    TotalStore(
                      monthlyData: _countNewPerMonth(cubit),
                    ),
                    const SizedBox(height: 25),
                    clipBathGradient(context, text: 'صافي الربح '),
                    const SizedBox(height: 30),
                    NetProfit(cubit.monthlyNetIncome),
                    const SizedBox(height: 20),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  /// list of user created months [1..12] (length unknown)
  List<double> _countNewPerMonth(FinancialCubit cubit) {
    DateTime now = DateTime.now();
    List<double> ret = List.generate(12, (index) => 0);
    Map<int, double> priceMap = {};
    cubit.parts.forEach((part) {
      if (priceMap.containsKey(part.availableDate?.month ?? 0)) {
        priceMap[part.availableDate?.month ?? 0] =
            priceMap[part.availableDate?.month ?? 0]! +
                (part.quantity * (part.sellingPrice ?? 0));
      } else {
        priceMap[part.availableDate?.month ?? 0] =
            part.quantity * (part.sellingPrice ?? 0);
      }
    });
    for (var e in priceMap.entries) {
      // if month == 0, then created is null
      if (e.key != 0) {
        ret[(e.key - now.month) % 12] += e.value;
      }
    }
    print("data: $ret");
    return ret;
  }
}
