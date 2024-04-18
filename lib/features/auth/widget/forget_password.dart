import 'package:flutter/material.dart';

import '../../../shared_utils/styles/text.dart';

Align forgetPassword(BuildContext context) {
  return Align(
      widthFactor: 3.4,
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: Text(
          'هل نسيت كلمة السر؟',
          style: AppStyles.styleRegular14(context).copyWith(color: Colors.white),
        ),
      ));
}
