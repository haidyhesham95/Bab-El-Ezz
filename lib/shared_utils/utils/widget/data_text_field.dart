import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../../styles/text.dart';

class DataTextField extends StatelessWidget {
  const DataTextField({super.key,required this.hintText, this.width, this.height, this.style, this.controller});
final String? hintText;
final double? width;
final double? height;
 final TextStyle? style;
 final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextField(
        controller:controller ,

        cursorColor: ColorsAsset.kGreen,
        textAlignVertical: TextAlignVertical.center,
        textDirection: TextDirection.rtl,
        style:style?? AppStyles.styleRegular14(context).copyWith(color: Colors.white),
        cursorHeight: 12,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle:style?? AppStyles.styleRegular14(context).copyWith(color: Colors.white),

        ),
      ),
    );
  }
}
