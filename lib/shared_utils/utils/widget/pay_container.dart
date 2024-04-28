import 'package:bab_el_ezz/shared_utils/styles/text.dart';
import 'package:flutter/material.dart';

import '../../styles/colors.dart';

class PayContainer extends StatelessWidget {
  const PayContainer({super.key,required this.title,required this.isTapped, this.onTap});
 final String ? title;
 final bool isTapped;
 final void Function()? onTap;


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
        onTap: onTap,
      child: Container(

       height: size.height * 0.055,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: ColorsAsset.kDarkGray,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
             SizedBox(width: size.width * 0.045),
            Container(
              height: 26,
              width: 26,
              decoration: BoxDecoration(
                color: isTapped ? ColorsAsset.kGreen : Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1,
                  color: ColorsAsset.kGreen,
                ),
              ),
            ),
            const SizedBox(width: 15,),
            Text('$title',style: AppStyles.styleLight18(context)),
          ],
        ),
      ),
    );
  }
}
