import 'package:bab_el_ezz/features/staff/widget/daily_table.dart';
import 'package:bab_el_ezz/features/staff/widget/staff_table.dart';
import 'package:flutter/material.dart';

import '../../../shared_utils/utils/widget/appbar_widget.dart';
import '../widget/toggle_button.dart';

class StaffPage extends StatefulWidget {
  const StaffPage({Key? key}) : super(key: key);

  @override
  _StaffPageState createState() => _StaffPageState();
}

class _StaffPageState extends State<StaffPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context),
      body: Center(
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            TableButton(
              selectedIndex: _selectedIndex,
              onPressed: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
            Visibility(
              visible: _selectedIndex == 0,
              child: Expanded(
                child: DailyTable(),
              ),
            ),
            Visibility(
              visible: _selectedIndex == 1,
              child: Expanded(
                child: StaffTable(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

