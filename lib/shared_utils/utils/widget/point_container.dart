import 'package:bab_el_ezz/shared_utils/styles/colors.dart';
import 'package:flutter/material.dart';
import '../../styles/text.dart';

class PointContainer extends StatelessWidget {
  const PointContainer({super.key, this.onPressed, this.text, this.color, this.colorText, this.style,});
  final void Function()? onPressed;
  final String? text;
  final Color? color;
  final Color? colorText;
  final TextStyle? style;


  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: 25,
        color:color?? Colors.white,
        child: InkWell(
          onTap: onPressed,
        child: Center(child: Text(text ?? '...',style:style?? AppStyles.styleSemiBold12(context).copyWith(color: colorText??ColorsAsset.kGreen),)),
        ),
      ),
    );
  }
}
