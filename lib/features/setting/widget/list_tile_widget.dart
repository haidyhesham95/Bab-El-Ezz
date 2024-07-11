
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared_utils/styles/text.dart';

Container listTileWidget (context, String assetName,String text,void Function()? onTap,{ double? radius,List<Color>? colors}) {
  return Container(
    height: 50,
    decoration:  BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(radius??0),
        bottomLeft: Radius.circular(radius??0),
      ),
      gradient: LinearGradient(
          colors: colors?? [

            const Color.fromRGBO(17, 62, 44, 97),
            const Color.fromRGBO(26, 96, 69, 95),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter),
    ),
    child: ListTile(
      leading: SvgPicture.asset(
      assetName
      ),
      title: Text(text, style: AppStyles.styleMedium16(context).copyWith( color: Colors.white)),
      onTap: onTap
    ),
  );
}