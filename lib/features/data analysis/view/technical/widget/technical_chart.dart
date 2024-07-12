import 'package:bab_el_ezz/data/job_order.dart';
import 'package:bab_el_ezz/shared_utils/utils/constant.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TechnicalChart extends StatefulWidget {
  TechnicalChart(this.jobOrders, {super.key});

  List<JobOrder> jobOrders;

  @override
  State<TechnicalChart> createState() => _TechnicalChartState();
}

class _TechnicalChartState extends State<TechnicalChart> {
  int activeIndex = -1;

  @override
  Widget build(BuildContext context) {
    print(widget.jobOrders.length);
    print(
        "maints: ${widget.jobOrders.map((e) => "${e.maintenanceType.toString()}-${e.isReturn}")}");
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
          value: getData(MAIN_TYPE_PERIODIC).toDouble(),
          radius: activeIndex == 0 ? 60 : 50,
          color: Colors.blue,
        ),
        PieChartSectionData(
          value: getData(MAIN_TYPE_PERIODIC, true).toDouble(),
          radius: activeIndex == 1 ? 60 : 50,
          color: Colors.green,
        ),
        PieChartSectionData(
          value: getData(MAIN_TYPE_FAULT).toDouble(),
          radius: activeIndex == 2 ? 60 : 50,
          color: const Color(0xff60BD68),
        ),
        PieChartSectionData(
          value: getData(MAIN_TYPE_FAULT, true).toDouble(),
          radius: activeIndex == 3 ? 60 : 50,
          color: const Color(0xffF1BA1A ),
        ),
      ],
    );
  }

  int getData(String mainType, [bool isReturn = false]) {
    return widget.jobOrders
        .where((e) => e.maintenanceType == mainType && e.isReturn == isReturn)
        .length;
  }
}
