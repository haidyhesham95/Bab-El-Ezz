import 'package:bab_el_ezz/shared_utils/styles/colors.dart';
import 'package:flutter/material.dart';

import '../../styles/text.dart';
import 'button_widget.dart';

class AddIconButton extends StatelessWidget {
  const AddIconButton({super.key, this.onPressed, this.text, this.width });
  final Function()? onPressed;
  final String? text;
  final double? width;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ButtonWidget(
      height:size.height*0.040 ,
      width:width?? size.width*0.32,
      borderRadius: 8,
      text:text?? "إضافة فاتورة",
      color:Colors.black.withOpacity(0.6) ,
      fontStyle:AppStyles.styleRegular16(context).copyWith(color: Colors.white) ,
      onPressed:onPressed ,

    );
  }
}


