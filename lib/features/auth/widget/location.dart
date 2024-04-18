import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../generated/assets.dart';
import '../../../shared_utils/styles/colors.dart';
import '../../../shared_utils/styles/text.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.08,
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorsAsset.kGreen,
            width: 1,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.imagesLocation,
            ),
            SizedBox(width: 20),
            Text(
              'الموقع',
              style: AppStyles.styleMedium16(context)
                  .copyWith(color: Colors.black),
            ),
          ],
        ));
  }
}
