import 'package:bab_el_ezz/shared_utils/styles/text.dart';
import 'package:flutter/material.dart';

import '../../../shared_utils/styles/colors.dart';

class DropButton extends StatelessWidget {
  const DropButton({super.key,required this.items, required this.onChanged,  this.value, required this.hintText, this.height, this.color,  this.padding,
    this.iconSize,
    this.styleHint, this.styleValue, this.width});
 final List<DropdownMenuItem<String>>? items;
 final void Function(String?)? onChanged;
 final String? value;
 final String hintText;
 final double? height;
  final double? width;
 final Color? color;
  final EdgeInsetsGeometry? padding;
  final double? iconSize;
  final TextStyle? styleHint ;
  final TextStyle? styleValue;

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: height ?? 45,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color?? Colors.white,
      ),
      child: DropdownButton(

        hint: Text(hintText, style:styleHint?? AppStyles.styleRegular14(context).copyWith(color: ColorsAsset.kDarkBrown,) ,),
        padding:padding?? const EdgeInsets.only(left: 10,right: 10),
      dropdownColor:color?? Colors.white,
      focusColor: ColorsAsset.kGreen,
      borderRadius: BorderRadius.circular(10),
       underline: const SizedBox(),
         value: value,
       iconSize: iconSize?? 24,
       icon: const Icon(Icons.keyboard_arrow_down_outlined,color: Colors.black,),
      isExpanded: true,
      style: styleValue?? AppStyles.styleSemiBold14(context),
      items:  items,
        onChanged: onChanged,

      ),
    );
  }
}
