import 'package:flutter/material.dart';

class WeeklyCalendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 7, // 7 days in a week
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
      ),
      itemBuilder: (BuildContext context, int index) {
        // Weekday names
        List<String> weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
        return Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(2.0),
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(weekdays[index]),
              // You can put additional widgets here to represent events/tasks
              // For simplicity, just showing the day index for now
              Text('${index + 1}'),
            ],
          ),
        );
      },
    );
  }
}