import 'package:bab_el_ezz/features/data%20analysis/view/technical/widget/new_customer_chart.dart';
import 'package:bab_el_ezz/features/data%20analysis/view/technical/widget/technical_date.dart';
import 'package:bab_el_ezz/features/data%20analysis/view/technical/widget/technical_cards.dart';
import 'package:bab_el_ezz/features/data%20analysis/view/technical/widget/technical_chart.dart';
import 'package:bab_el_ezz/features/data%20analysis/view/technical/widget/technical_details.dart';
import 'package:flutter/material.dart';

import '../../../../../shared_utils/utils/widget/clip_path_gradient.dart';
import '../widget/technical_bar_chart.dart';

class TechnicalAnalysis extends StatelessWidget {
  const TechnicalAnalysis({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            TechnicalDate(),
            SizedBox(height: 30),
            TechnicalCards(),
            SizedBox(height: 40),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: TechnicalDetails()),
                Expanded(child: TechnicalChart()),
                SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 20),

            clipBathGradient(context, text: 'العملاء الجدد '),
            const SizedBox(height: 30),
            const NewCustomerChart(),
            const SizedBox(height: 25),
            clipBathGradient(context, text: 'قطع الغيار / الاكثر استخداما '),
            const SizedBox(height: 30),
            TechnicalBarChart(),
            const SizedBox(height: 25),



          ],
        ),
      )
    );
  }
}
