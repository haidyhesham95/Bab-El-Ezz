import 'package:flutter/material.dart';

import '../../../shared_utils/styles/colors.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key, this.color,required this.onPressed, this.colorGround, this.height, this.width});
 final Color? color;
  final Color? colorGround;
 final double? height;
 final double? width;

  final  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height:height?? 45,
      width:width?? 45,
      decoration: BoxDecoration(
        color: colorGround??ColorsAsset.kDarkGray,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          Icons.add,
          color:  color ?? Colors.black,
          size: 20,
        ),
      ),
    );
  }
}
