import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TechnicalBarChart extends StatelessWidget {
  const TechnicalBarChart({super.key, });


  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(

    primaryXAxis: CategoryAxis(
    title: AxisTitle(text: ''),
    ),
    primaryYAxis: NumericAxis(

    title: AxisTitle(text: ''),
    ),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <CartesianSeries<dynamic, String>>[
        BarSeries<dynamic, String>(
          enableTooltip: true,
          color: Colors.blue,
          dataSource: [
            {'name': '5', 'amount': 4},
            {'name': 'النوع الثاني', 'amount': 3},
            {'name': 'Type 3', 'amount': 2},
            {'name': 'Type 4', 'amount': 1},
            {'name': 'النوع الاول', 'amount': 0},
          ],
          xValueMapper: (dynamic data, _) => data['name'],
          yValueMapper: (dynamic data, _) => data['amount'],
        ),
      ],
    );
  }
}
