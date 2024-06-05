import 'package:flutter/material.dart';

import '../../styles/colors.dart';

class ShadowContainer extends StatelessWidget {
  const ShadowContainer({
    super.key,
    required this.onTap,
    required this.child,
    this.radius = 0,
    this.colorShadow,
  });

  final void Function()? onTap;
  final Widget? child;
  final double radius;
  final Color? colorShadow; // Declare colorShadow here

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
          horizontal: radius,
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: colorShadow ?? Colors.white,
              blurRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(
            width: 1,
            color: ColorsAsset.kGreen,
          ),
          color: Colors.black,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: InkWell(
          onTap: onTap,
          child: child,
        ));
  }
}
