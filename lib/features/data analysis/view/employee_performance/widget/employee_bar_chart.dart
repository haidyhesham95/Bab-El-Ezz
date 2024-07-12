import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class EmployeeBarChart extends StatefulWidget {
  EmployeeBarChart(this.techCars, {super.key});

  Map<String, int> techCars;

  @override
  State<EmployeeBarChart> createState() => _EmployeeBarChartState();
}

class _EmployeeBarChartState extends State<EmployeeBarChart> {
  BarChartGroupData generateBarGroup(
    int x,
    Color color,
    double value,
  ) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          borderRadius: BorderRadius.circular(0),
          toY: value,
          color: color,
          width: 50,
        ),
      ],
      showingTooltipIndicators: touchedGroupIndex == x ? [0] : [],
    );
  }

  int touchedGroupIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 15),
      child: AspectRatio(
        aspectRatio: 2,
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceEvenly,
            borderData: FlBorderData(
              show: true,
              border: Border.symmetric(
                horizontal: BorderSide(
                  color: Colors.grey.withOpacity(0.1),
                  width: 0.25,
                ),
              ),
            ),
            titlesData: FlTitlesData(
              show: true,
              leftTitles: AxisTitles(
                drawBelowEverything: true,
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  interval: 1,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      value.toInt().toString(),
                      textAlign: TextAlign.left,
                    );
                  },
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 36,
                  getTitlesWidget: (value, meta) {
                    return SideTitleWidget(
                      fitInside: SideTitleFitInsideData.fromTitleMeta(meta),
                      axisSide: meta.axisSide,
                      child: TextWidget(
                        text: widget.techCars.keys.isNotEmpty
                            ? widget.techCars.keys.elementAt(value.toInt())
                            : '',
                      ),
                    );
                  },
                ),
              ),
              rightTitles: const AxisTitles(),
              topTitles: const AxisTitles(),
            ),
            gridData: FlGridData(
              verticalInterval: 1,
              show: true,
              drawVerticalLine: false,
              getDrawingHorizontalLine: (value) => FlLine(
                color: Colors.grey.withOpacity(0.1),
                strokeWidth: 0.25,
              ),
            ),
            barGroups: widget.techCars.entries
                .map((e) => _BarData(Colors.green, e.value.toDouble()))
                .toList()
                .asMap()
                .entries
                .indexed
                .map((e) {
              final index = e.$1;
              print("index: $index");
              final data = e.$2.value;
              return generateBarGroup(
                index,
                data.color,
                data.value,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _BarData {
  const _BarData(
    this.color,
    this.value,
  );
  final Color color;
  final double value;
}

class TextWidget extends StatelessWidget {
  TextWidget({super.key, required this.text});

  String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
    );
  }
}
