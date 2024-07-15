import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TechnicalBarChart extends StatelessWidget {
  TechnicalBarChart(
    this.partUsageCounts, {
    super.key,
  });

  final Map<String, int> partUsageCounts;
  List dataList = [];

  @override
  Widget build(BuildContext context) {
    dataList = partUsageCounts.entries
        .map((e) => {'name': e.key, 'amount': e.value})
        .take(5)
        .toList();
    dataList.sort((a, b) => (a['amount'] as int).compareTo(b['amount']));
    return SfCartesianChart(
      primaryXAxis: const CategoryAxis(
        title: AxisTitle(text: ''),
      ),
      primaryYAxis: const NumericAxis(
        title: AxisTitle(text: ''),
      ),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <CartesianSeries<dynamic, String>>[
        BarSeries<dynamic, String>(
          width: 0.3,
          enableTooltip: true,
          color: Colors.blue,
          dataSource: dataList,
          xValueMapper: (dynamic data, _) => data['name'],
          yValueMapper: (dynamic data, _) => data['amount'],
        ),
      ],
    );
  }
}
