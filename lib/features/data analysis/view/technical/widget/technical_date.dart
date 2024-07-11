import 'package:bab_el_ezz/shared_utils/styles/colors.dart';
import 'package:bab_el_ezz/shared_utils/styles/text.dart';
import 'package:flutter/material.dart';

class TechnicalDate extends StatelessWidget {
  TechnicalDate({super.key, required this.onTap, required this.text});
  Function() onTap;
  String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: ColorsAsset.kGreen),
        ),
        child: Center(
          child: Text(
            text,
            style: AppStyles.styleMedium16(context),
          ),
        ),
      ),
    );
  }
}
