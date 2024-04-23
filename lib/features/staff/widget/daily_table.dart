import 'package:flutter/material.dart';
import 'package:bab_el_ezz/features/staff/widget/item_daily_table.dart';
import 'package:bab_el_ezz/features/staff/widget/top_daily_table.dart';
import 'package:bab_el_ezz/shared_utils/styles/text.dart';
import 'package:intl/intl.dart';
class DailyTable extends StatelessWidget {
  const DailyTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Text(
            DateFormat.yMEd('ar').format(DateTime.now()),
            style: AppStyles.styleBold15(context),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  topDailyTable(context),
                  const SizedBox(
                    height: 1,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 1,
                      ),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return ItemDailyTable();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
