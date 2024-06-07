import 'package:flutter/material.dart';

import '../../styles/text.dart';

Align showDetailsText(
    {required BuildContext context,
    required Function() onPressed,
    required bool showAll}) {
  return Align(
    alignment: Alignment.centerLeft,
    child: TextButton(
      onPressed: onPressed,
      child: Text(
        showAll ? 'عرض تفاصيل أقل' : 'عرض كل التفاصيل',
        style: AppStyles.styleSemiBold14(context).copyWith(
          color: Colors.white,
        ),
      ),
    ),
  );
}
