import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../generated/assets.dart';
import '../../../shared_utils/styles/colors.dart';
import '../../../shared_utils/styles/text.dart';

class RowTextButton extends StatelessWidget {
  const RowTextButton({super.key, required this.text, required this.assetName, required this.onPressed});
  final String text;
  final String assetName;
 final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  Center(
      child: SizedBox(
        width: size.width * 0.9,
        child: TextButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(Size(size.width, 56)),
              backgroundColor: MaterialStateProperty.all(ColorsAsset.kGreen),
              iconColor: MaterialStateProperty.all(Colors.white),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
            ),
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                    children:[
                      SvgPicture.asset(assetName),
                      const SizedBox(width: 10,),
                      Text(text,
                        style: AppStyles.styleBold13(context),),
                    ] ),
                Row(
                  children:[
                    SvgPicture.asset(Assets.imagesArrowleft, ),
                  ],

                ),

              ],
            )
        ),
      ),
    )
    ;
  }
}
