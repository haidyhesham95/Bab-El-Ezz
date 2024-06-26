import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../../../shared_utils/styles/colors.dart';
class EmployeeChart extends StatefulWidget {
  const EmployeeChart({super.key});

  @override
  State<EmployeeChart> createState() => _EmployeeChartState();
}

class _EmployeeChartState extends State<EmployeeChart> {
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
          value: 40,
          radius: activeIndex == 0 ? 60 : 50,
          color: Colors.blue,
        ),
        PieChartSectionData(
          value: 25,
          radius: activeIndex == 1 ? 60 : 50,
          color: Colors.green,
        ),
        PieChartSectionData(
          value: 30,
          radius: activeIndex == 2 ? 60 : 50,
          color: Colors.red,
        ),
        PieChartSectionData(
          value: 30,
          radius: activeIndex == 3 ? 60 : 50,
          color: Colors.orange,
        ),

      ],
    );
  }
}
