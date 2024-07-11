import 'package:bab_el_ezz/features/data%20analysis/view/financial/widget/financial_cards.dart';
import 'package:bab_el_ezz/features/data%20analysis/view/financial/widget/financial_date.dart';
import 'package:bab_el_ezz/features/data%20analysis/view/financial/widget/net_profit.dart';
import 'package:bab_el_ezz/features/data%20analysis/view/financial/widget/revenues_details.dart';
import 'package:flutter/material.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const FinancialDate(),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.only(
                  right: 5,
                  left: 5,
                ),
                child: FinancialCards(),
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
          ),
        ),
      ),
    );
  }
}
