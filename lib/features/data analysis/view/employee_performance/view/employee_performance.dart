import 'package:bab_el_ezz/features/data%20analysis/view/employee_performance/widget/employee_bar_chart.dart';
import 'package:bab_el_ezz/features/data%20analysis/view/employee_performance/widget/employee_chart.dart';
import 'package:bab_el_ezz/features/data%20analysis/view/employee_performance/widget/employee_chart_details.dart';
import 'package:flutter/material.dart';

import '../widget/employee_date.dart';

class EmployeePerformance extends StatelessWidget {
  const EmployeePerformance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const EmployeeDate(),
            const SizedBox(height: 30),
            EmployeeBarChart(),
            const SizedBox(height: 50),

            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: EmployeeChartDetails()),
                Expanded(child: EmployeeChart()),
                SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 20,)
          ],
        ),
      )
    );
  }
}
