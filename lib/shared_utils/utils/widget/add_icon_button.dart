import 'package:bab_el_ezz/shared_utils/styles/colors.dart';
import 'package:flutter/material.dart';

import '../../styles/text.dart';

ElevatedButton addIconButton(context, void Function()? onPressed) {
  return ElevatedButton(
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Colors.black.withOpacity(0.6)),

      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
      )
    ),
      onPressed: onPressed,
      child:  Text('إضافة فاتورة', style: AppStyles.styleRegular16(context).copyWith(color: Colors.white),));
}