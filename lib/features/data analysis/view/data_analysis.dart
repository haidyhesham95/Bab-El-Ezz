import 'package:bab_el_ezz/features/data%20analysis/view/customer_opinions/view/customer_opinions.dart';
import 'package:bab_el_ezz/features/data%20analysis/view/financial/view/financial_accounts.dart';
import 'package:bab_el_ezz/features/data%20analysis/view/technical/view/technical_analysis.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/const_appbar.dart';
import 'package:flutter/material.dart';

import '../../../shared_utils/styles/colors.dart';
import '../../../shared_utils/styles/text.dart';
import 'employee_performance/view/employee_performance.dart';



class DataAnalysis extends StatelessWidget {
  const DataAnalysis({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // The number of tabs
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('تحليل البيانات',
            style: AppStyles.styleExtraBold15(context),
          ),
          bottom: TabBar(
            indicatorColor:ColorsAsset.kGreen,
            dividerColor: Colors.transparent,
            unselectedLabelColor: ColorsAsset.kLightGray.withOpacity(0.4),
            labelColor: ColorsAsset.kGreen,
            tabs: [
              Tab(text: 'الحسابات المالية'),
              Tab(text: 'التحليل الفني'),
              Tab(text: 'آداء العاملين'),
              Tab(text: 'آراء العملاء'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FinancialAccounts(),
            TechnicalAnalysis(),
            EmployeePerformance(),
            CustomerOpinions(),
          ],
        ),
      ),
    );
  }
}
