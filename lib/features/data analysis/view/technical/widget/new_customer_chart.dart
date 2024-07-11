import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import for date formatting

class NewCustomerChart extends StatefulWidget {
  final List<int> monthlyData; // Data for the past 12 months

  const NewCustomerChart({Key? key, required this.monthlyData})
      : super(key: key);

  @override
  State<NewCustomerChart> createState() => _NewCustomerChartState();
}

class _NewCustomerChartState extends State<NewCustomerChart> {
  final List<Color> gradientColors = [
    Colors.green, // Customize as needed
    Colors.grey, // Customize as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: LineChart(_createLineChartData()),
          ),
        ),
      ],
    );
  }

  LineChartData _createLineChartData() {
    List<FlSpot> spots = [];

    // Create FlSpots from the data
    for (int i = 0; i < widget.monthlyData.length; i++) {
      spots.add(FlSpot(i.toDouble(), widget.monthlyData[i].toDouble()));
    }

    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) => FlLine(color: Colors.transparent),
        getDrawingVerticalLine: (value) => FlLine(color: Colors.transparent),
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: true)),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: _bottomTitleWidgets,
          ),
        ),
        leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      // ... (other chart properties - borderData, minX, maxX, minY, maxY)
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          gradient: LinearGradient(colors: gradientColors),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
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
    final monthName = DateFormat('MMM', "ar").format(monthDate);

    return SideTitleWidget(
      angle: 45,
      axisSide: meta.axisSide,
      child: Text(monthName),
    );
  }
}
