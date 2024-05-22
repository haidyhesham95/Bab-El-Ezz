import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../generated/assets.dart';
import '../../../../shared_utils/styles/text.dart';
import '../../../../shared_utils/utils/widget/shadow_container.dart';

ShadowContainer itemAddJobContainer(context) {
  return ShadowContainer(
    radius: 10,
    onTap: () {
      Navigator.pushNamed(context, 'searchClient');
    },
    colorShadow: Colors.transparent,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'امر شغل جديد',
          style: AppStyles.styleMedium16(context),
        ),
        SvgPicture.asset(Assets.imagesAddAlbum),
      ],
    ),
  );
}
