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
                      padding: const EdgeInsets.only(
                        right: 5,
                        left: 5,
                      ),
                      child: FinancialCards(
                          cubit.net, cubit.storePrice, cubit.remaining),
                    ),
                    const SizedBox(height: 30),
                    clipBathGradient(context, text: 'الإيرادات '),
                    const SizedBox(height: 30),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(child: RevenuesDetails()),
                        Expanded(child: RevenuesChart()),
                        SizedBox(width: 10),
                      ],
                    ),
                    const SizedBox(height: 20),
                    clipBathGradient(context, text: 'اجمالي المصروفات '),
                    const SizedBox(height: 30),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(child: TotalDetails()),
                        Expanded(child: TotalChart()),
                        SizedBox(width: 10),
                      ],
                    ),
                    const SizedBox(height: 25),
                    clipBathGradient(context, text: 'اجمالي رصيد المخزن '),
                    const SizedBox(height: 30),
                    const TotalStore(),
                    const SizedBox(height: 25),
                    clipBathGradient(context, text: 'صافي الربح '),
                    const SizedBox(height: 30),
                    const NetProfit(),
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
}
