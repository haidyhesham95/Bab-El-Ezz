
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared_utils/styles/colors.dart';

Container themeContainer (context,String assetName ,InvalidType) {
  final size = MediaQuery.of(context).size;

 return Container(
    width: size.width * 0.15,
    height: size.height * 0.035,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100),
      color: InvalidType
          ? ColorsAsset.kGreen
          : Colors.transparent,
    ),
    child: Center(
      child: SvgPicture.asset(
         assetName
         ,),
    ),
  );
}
