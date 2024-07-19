import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RevenuesChart extends StatefulWidget {
  RevenuesChart({super.key, required this.service, required this.parts});
  double service, parts;

  @override
  State<RevenuesChart> createState() => _RevenuesChartState();
}

class _RevenuesChartState extends State<RevenuesChart> {
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
          value: widget.service,
          radius: activeIndex == 0 ? 60 : 50,
          color: const Color(0xFF0E9FE9),
        ),
        PieChartSectionData(
          value: widget.parts,
          radius: activeIndex == 1 ? 60 : 50,
          color: const Color(0xFFF1BA1A),
        ),
      ],
    );
  }
}
