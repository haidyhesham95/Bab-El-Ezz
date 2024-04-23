import 'package:flutter/material.dart';
import '../../styles/colors.dart';
import '../../styles/text.dart';
class GreenContainer extends StatelessWidget {
  const GreenContainer({super.key, required this.text, this.flex=2, this.style, this.width, });
 final String? text;
 final int? flex ;
  final TextStyle? style;
  final double?width;


  @override
  Widget build(BuildContext context) {
    return
    Container(
      height: 25,
      width: width??50,
      color: ColorsAsset.kGreen,
      child: Center(child: Text(text!,style:style?? AppStyles.styleRegular10(context).copyWith(color: Colors.white),)),
    );
  }
}
