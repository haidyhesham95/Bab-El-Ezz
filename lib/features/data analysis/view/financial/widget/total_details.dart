
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'item.dart';
import 'model_details.dart';


class TotalDetails extends StatelessWidget {
  const TotalDetails({super.key});

  static const items = [
    ItemDetailsModel(
        color: Color(0xff5DA5DA ),title: 'أجور', value: '%40'),
    ItemDetailsModel(
        color:Color(0xffFAA43A), title: 'فواتير موردين', value: '%55'),

    ItemDetailsModel(
        color:Color(0xff60BD68), title: 'مصروفات يومية', value: '%30'),

  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((e) => ItemDetails(itemDetailsModel: e)).toList(),
    );

  }
}