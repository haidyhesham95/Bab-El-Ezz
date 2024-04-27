import 'package:flutter/cupertino.dart';

import '../../styles/text.dart';

Align textAlign (BuildContext context, String text,{  TextStyle? style}) {
  return Align(
      alignment: Alignment.centerRight,
      child: Text(
        text,
        style:style?? AppStyles.styleMedium18(context),
      ));
}