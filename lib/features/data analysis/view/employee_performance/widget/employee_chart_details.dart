import 'package:bab_el_ezz/data/job_order.dart';
import 'package:bab_el_ezz/shared_utils/utils/constant.dart';
import 'package:flutter/material.dart';

import '../../financial/widget/item.dart';
import '../../financial/widget/model_details.dart';

class EmployeeChartDetails extends StatelessWidget {
  EmployeeChartDetails(this.jobOrders, {super.key});

  List<JobOrder> jobOrders;

  @override
  Widget build(BuildContext context) {
    List items = [
      ItemDetailsModel(
          color: Colors.blue,
          title: 'صيانات دورية صحيحة',
          value: getData(MAIN_TYPE_PERIODIC)),
      ItemDetailsModel(
          color: Colors.green,
          title: 'صيانات دورية مرتجع',
          value: getData(MAIN_TYPE_PERIODIC, true)),
      ItemDetailsModel(
          color: Colors.red,
          title: 'صيانات أعطال صحيحة',
          value: getData(MAIN_TYPE_FAULT)),
      ItemDetailsModel(
          color: Colors.orange,
          title: 'صيانات أعطال مرتجع',
          value: getData(MAIN_TYPE_FAULT, true)),
    ];
    return SizedBox(
      height: 80,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
         childAspectRatio: 8
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ItemDetails(itemDetailsModel: items[index]);
        },
      )
    );
  }

  String getData(String mainType, [bool isReturn = false]) {
    return jobOrders
        .where((e) {
          return e.maintenanceType == mainType && e.isReturn == isReturn;
        })
        .length
        .toString();
  }
}
