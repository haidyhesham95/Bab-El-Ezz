import 'package:flutter/material.dart';
import 'package:bab_el_ezz/features/staff/widget/item_daily_table.dart';
import 'package:bab_el_ezz/features/staff/widget/top_daily_table.dart';
import 'package:bab_el_ezz/shared_utils/styles/text.dart';
import 'package:intl/intl.dart';
class DailyTable extends StatelessWidget {
  const DailyTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      children:  [
        SizedBox(height: 20),
        Text(
          DateFormat.yMEd('ar').format(
            DateTime.now(),
          ),
          style: AppStyles.styleBold15(context),
        ),
        SizedBox(height: 20),
        topDailyTable(context),
        const SizedBox(
          height: 1,
        ),
        Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              separatorBuilder: (context, index) => const SizedBox(
                height: 1,
              ),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                    child: ItemDailyTable());
              },
            ))

      ]
    );
  }
}
