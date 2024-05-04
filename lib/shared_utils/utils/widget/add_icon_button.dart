import 'package:flutter/material.dart';

import '../../styles/text.dart';

TextButton addIconButton(context, void Function()? onPressed) {
  return TextButton(
      child:  Text('إضافة فاتورة', style: AppStyles.styleRegular16(context).copyWith(color: Colors.white),) ,
      onPressed: onPressed);
}