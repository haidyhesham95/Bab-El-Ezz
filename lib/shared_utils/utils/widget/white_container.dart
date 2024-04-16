import 'package:flutter/material.dart';
import '../../styles/text.dart';
class WhiteContainer extends StatelessWidget {
  const WhiteContainer({super.key, this.text, this.style, this.flex=2});

  final String? text;
  final int? flex ;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return
      Expanded(
        flex: flex!,
        child: Container(
          height: 25,
          color: Colors.white,
          child: Center(child: Text(text!,style:style?? AppStyles.styleRegular10(context))),
        ),
      );
  }
}
