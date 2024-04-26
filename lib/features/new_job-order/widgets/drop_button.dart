import 'package:bab_el_ezz/shared_utils/styles/text.dart';
import 'package:flutter/material.dart';

import '../../../shared_utils/styles/colors.dart';

class DropButton extends StatelessWidget {
  const DropButton({super.key,required this.items, required this.onChanged,  this.value, required this.hintText, this.height, this.color, this.borderRadius, this.padding,
    this.iconSize,
    this.styleHint, this.styleValue});
 final List<DropdownMenuItem<String>>? items;
 final void Function(String?)? onChanged;
 final String? value;
 final String hintText;
 final double? height;
 final Color? color;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final double? iconSize;
  final TextStyle? styleHint ;
  final TextStyle? styleValue;

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: height ?? 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius??4),
        color: color?? Colors.white,
      ),
      child: DropdownButton(

        hint: Text(hintText, style:styleHint?? AppStyles.styleSemiBold14(context),),
        padding:padding?? const EdgeInsets.only(left: 10,right: 10),
      dropdownColor:color?? Colors.white,
      focusColor: ColorsAsset.kGreen,
      borderRadius: BorderRadius.circular(borderRadius??4),
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
