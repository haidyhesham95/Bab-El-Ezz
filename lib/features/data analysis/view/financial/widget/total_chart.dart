import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TotalChart extends StatefulWidget {
  TotalChart(
      {super.key,
      required this.salaries,
      required this.merchantInvoices,
      required this.dailyExpenses});
  double salaries, merchantInvoices, dailyExpenses;

  @override
  State<TotalChart> createState() => _TotalChartState();
}

class _TotalChartState extends State<TotalChart> {
  int activeIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: PieChart(getChartData()),
    );
  }

  PieChartData getChartData() {
    return PieChartData(
      pieTouchData: PieTouchData(
        enabled: true,
        touchCallback: (p0, pietouchResponse) {
          activeIndex =
              pietouchResponse?.touchedSection?.touchedSectionIndex ?? -1;
          setState(() {});
        },
      ),
      sectionsSpace: 0,
      sections: [
        PieChartSectionData(
          value: widget.merchantInvoices,
          radius: activeIndex == 0 ? 60 : 50,
          color: const Color(0xffF1BA1A),
        ),
        PieChartSectionData(
          value: widget.salaries,
          radius: activeIndex == 1 ? 60 : 50,
          color: Colors.blue,
        ),
        PieChartSectionData(
            value: widget.dailyExpenses,
            radius: activeIndex == 2 ? 60 : 50,
            color: const Color(0xff60BD68)),
      ],
    );
  }
}
