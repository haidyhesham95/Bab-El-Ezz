import 'package:flutter/cupertino.dart';

import '../../styles/text.dart';

Align textAlign (BuildContext context, String text) {
  return Align(
      alignment: Alignment.centerRight,
      child: Text(
        text,
        style: AppStyles.styleMedium18(context),
      ));
}