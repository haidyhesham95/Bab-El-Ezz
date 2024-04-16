import 'package:flutter/material.dart';

import '../../../shared_utils/styles/colors.dart';

class CustomDivider extends StatelessWidget {
 const CustomDivider({super.key,  this.height, this.width, this.borderRadius});
 final double? height;
final double? width;
final double? borderRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsAsset.kGreen,
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
      ),
      height:height?? 4,
      width:width?? 19 ,
    );

  }
}
