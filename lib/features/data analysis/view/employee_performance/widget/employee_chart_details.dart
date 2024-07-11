import 'package:flutter/material.dart';

import '../../financial/widget/item.dart';
import '../../financial/widget/model_details.dart';

class EmployeeChartDetails extends StatelessWidget {
  EmployeeChartDetails(this.techCars, {super.key});

  Map<String, int> techCars;

  static const items = [
    ItemDetailsModel(
        color: Colors.blue, title: 'صيانات دورية صحيحة', value: '%72'),
    ItemDetailsModel(
        color: Colors.green, title: 'صيانات دورية مرتجع', value: '%55'),
    ItemDetailsModel(
        color: Colors.red, title: 'صيانات أعطال صحيحة', value: '%72'),
    ItemDetailsModel(
        color: Colors.orange, title: 'صيانات أعطال مرتجع', value: '%55'),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((e) => ItemDetails(itemDetailsModel: e)).toList(),
    );
  }
}
