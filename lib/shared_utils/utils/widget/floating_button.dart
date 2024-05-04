import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../../styles/text.dart';

SizedBox floatingButton({required BuildContext context,required void Function()? onPressed,required String text}) {
  final size = MediaQuery.of(context).size;
  return SizedBox(
    height: size.height * 0.05,
    width: size.width * 0.3,
    child: FloatingActionButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onPressed: onPressed,
      backgroundColor: ColorsAsset.kGreen,
      child: Center(
        child: Text(text,
            textAlign: TextAlign.center,
            style: AppStyles.styleRegular14(context).copyWith(
              color: Colors.white,
            )),
      ),
    ),
  );
}
