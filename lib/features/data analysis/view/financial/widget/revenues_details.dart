import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'item.dart';
import 'model_details.dart';

class RevenuesDetails extends StatelessWidget {
  RevenuesDetails({super.key, required this.service, required this.parts});
  double service, parts;

  @override
  Widget build(BuildContext context) {
    List items = [
      ItemDetailsModel(
          color: Color(0xFF0E9FE9),
          title: 'مصنعيات',
          value: service.toString()),
      ItemDetailsModel(
          color: Color(0xFFF1BA1A), title: 'قطع غيار', value: parts.toString()),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((e) => ItemDetails(itemDetailsModel: e)).toList(),
    );
  }
}
