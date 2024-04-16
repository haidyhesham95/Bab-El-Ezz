import 'package:flutter/material.dart';
import '../../styles/colors.dart';
import '../../styles/text.dart';
class GreenContainer extends StatelessWidget {
  const GreenContainer({super.key, required this.text, this.flex=2, });
 final String? text;
 final int? flex ;

  @override
  Widget build(BuildContext context) {
    return
    Expanded(
      flex: flex!,
      child: Container(
        height: 25,
        color: ColorsAsset.kGreen,
        child: Center(child: Text(text!,style: AppStyles.styleRegular10(context).copyWith(color: Colors.white),)),
      ),
    );
  }
}
