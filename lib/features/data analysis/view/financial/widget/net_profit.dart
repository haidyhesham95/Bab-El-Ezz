import 'package:bab_el_ezz/shared_utils/styles/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NetProfit extends StatefulWidget {
  NetProfit(this.monthlyNetIncome, {super.key});

  List<double> monthlyNetIncome;

  @override
  State<NetProfit> createState() => _NetProfitState();
}

class _NetProfitState extends State<NetProfit> {
  final List<Color> gradientColors = [
    ColorsAsset.kGreen,
    ColorsAsset.kDarkGray
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: LineChart(mainData()),
          ),
        ),
      ],
    );
  }

  LineChartData mainData() {
    List<FlSpot> spots = [];
    print("net: ${widget.monthlyNetIncome}");

    // Create FlSpots from the data
    for (int i = 0; i < widget.monthlyNetIncome.length; i++) {
      spots.add(FlSpot(i.toDouble(), widget.monthlyNetIncome[i].toDouble()));
    }

    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.transparent,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Colors.transparent,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: true),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 60,
            interval: 1,
            getTitlesWidget: _bottomTitleWidgets,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            interval: 1,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      minY: 0,
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: false,
          gradient: LinearGradient(colors: gradientColors),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.1))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _bottomTitleWidgets(double value, TitleMeta meta) {
    final now = DateTime.now();
    final monthDate = now.add(Duration(days: value.toInt() * 30));
    final monthName =
        DateFormat('MMM', "ar").format(now.copyWith(month: value.toInt()));

    return SideTitleWidget(
      angle: 45,
      axisSide: meta.axisSide,
      child: Text(monthName),
    );
  }
}
