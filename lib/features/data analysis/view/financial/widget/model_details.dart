import 'package:flutter/material.dart';

class ItemDetailsModel {
  final Color color;
  final String? title, value;

  const ItemDetailsModel(
      {required this.color, required this.title,  this.value});
}