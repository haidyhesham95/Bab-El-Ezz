import 'package:flutter/material.dart';

import '../../../shared_utils/styles/colors.dart';

class GrayContainer extends StatelessWidget {
  const GrayContainer({super.key, required this.child, this.height, this.padding, this.margin});

  final Widget? child;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height?? 141,
        margin: margin,
        padding: padding,
        width: 380,
        decoration: BoxDecoration(
          color: ColorsAsset.kDarkBrown.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: child);
  }
}
