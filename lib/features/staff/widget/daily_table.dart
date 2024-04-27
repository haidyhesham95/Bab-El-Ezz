import 'package:flutter/material.dart';
import 'package:bab_el_ezz/features/staff/widget/DailyDataTable.dart';
import 'package:bab_el_ezz/shared_utils/styles/text.dart';
import 'package:intl/intl.dart';

class DailyTable extends StatelessWidget {
  const DailyTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              DateFormat.yMEd('ar').format(DateTime.now()),
              style: AppStyles.styleBold15(context),
            ),
            const SizedBox(height: 20),
            DailyDataTable(
              onPressed: (){
                Navigator.pushNamed(context, "addDailyItem");
              },
            )
          ],
        ),
      ),
    );
  }
}
