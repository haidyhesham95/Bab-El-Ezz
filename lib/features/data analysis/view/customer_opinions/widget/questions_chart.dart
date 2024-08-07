import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


class QuestionsChart extends StatefulWidget {
  const QuestionsChart({super.key});

  @override
  State<QuestionsChart> createState() => _QuestionsChartState();
}

class _QuestionsChartState extends State<QuestionsChart> {
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
          value: 72,
          radius: activeIndex == 0 ? 60 : 50,
          color: Colors.blue,
        ),
        PieChartSectionData(
          value: 55,
          radius: activeIndex == 1 ? 60 : 50,
          color: const Color(0xFFF1C40F),
        ),
        PieChartSectionData(
          value: 55,
          radius: activeIndex == 1 ? 60 : 50,
          color: Colors.green,
        ),

      ],
    );
  }
}
