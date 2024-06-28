import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../shared_utils/styles/colors.dart';
import 'item.dart';
import 'model_details.dart';


class RevenuesDetails extends StatelessWidget {
  const RevenuesDetails({super.key});

  static const items = [
    ItemDetailsModel(
        color: Color(0xFF2C3E50),title: 'مصنعيات', value: '%72'),
    ItemDetailsModel(
        color:Color(0xFFE74C3C), title: 'قطع غيار', value: '%55'),

  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((e) => ItemDetails(itemDetailsModel: e)).toList(),
    );

  }
}