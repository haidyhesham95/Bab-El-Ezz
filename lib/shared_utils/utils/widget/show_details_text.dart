import 'package:flutter/material.dart';

import '../../styles/text.dart';

Align showDetailsText({required BuildContext context,required Function() onPressed}) {
  return Align(
    alignment: Alignment.centerLeft,
    child: TextButton(
      onPressed: onPressed,
      child: Text(
        'عرض كل التفاصيل',
        style: AppStyles.styleSemiBold14(context).copyWith(
          color: Colors.white,
        ),
      ),
    ),
  );

}
