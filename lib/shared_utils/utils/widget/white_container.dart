import 'package:flutter/material.dart';
import '../../styles/text.dart';
class WhiteContainer extends StatelessWidget {
  const WhiteContainer({super.key, this.text, this.style, this.flex=2, this.width});

  final String? text;
  final int? flex ;
  final TextStyle? style;
  final double?width;


  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: 25,
        width:width??50,
        color: Colors.white,
        child: Center(child: Text(text!,style:style?? AppStyles.styleRegular10(context))),
      );
  }
}
