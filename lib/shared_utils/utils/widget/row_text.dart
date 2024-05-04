import 'package:flutter/material.dart';

import '../../styles/text.dart';

class RowText extends StatelessWidget {
  const RowText(this.title, this.data, {super.key, this.textStyle, this.dataStyle});
final String? title;
final String? data;
final TextStyle? textStyle;
final TextStyle? dataStyle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Text(' $title ', style: textStyle ?? AppStyles.styleSemiBold16(context),),
          Text(' $data ',style: dataStyle ?? AppStyles.styleSemiBold14(context).copyWith(color: Colors.white)),
        ],
      ),
    );
  }
}
