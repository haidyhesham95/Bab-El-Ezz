import 'package:bab_el_ezz/shared_utils/styles/text.dart';
import 'package:flutter/material.dart';

import '../../styles/colors.dart';

class PayContainer extends StatefulWidget {
  const PayContainer({super.key,required this.title});
 final String ? title;

  @override
  State<PayContainer> createState() => _PayContainerState();
}

class _PayContainerState extends State<PayContainer> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
        onTap: () {
      setState(() {
        isTapped = !isTapped;
      });},
      child: Container(
       height: size.height * 0.055,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: ColorsAsset.kDarkGray,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
             SizedBox(width: size.width * 0.045),
            Container(
              height: 26,
              width: 26,
              decoration: BoxDecoration(
                color: isTapped ? ColorsAsset.kGreen : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1,
                  color: ColorsAsset.kGreen,
                ),
              ),
            ),
            const SizedBox(width: 15,),
            Text('${widget.title}',style: AppStyles.styleLight18(context)),
          ],
        ),
      ),
    );
  }
}
