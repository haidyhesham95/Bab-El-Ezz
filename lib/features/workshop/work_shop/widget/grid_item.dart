import 'package:flutter/material.dart';

import '../../../../shared_utils/styles/text.dart';
import '../../../../shared_utils/utils/widget/shadow_container.dart';


ShadowContainer gridItem (context) {
  return ShadowContainer(
    radius: 10,
    onTap: (){
      Navigator.pushNamed(context, 'newJobOrderPage');
    },
    child:Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('رينو لوجان',
          style: AppStyles.styleMedium16(context),),
        Text('س ل م 1234',
          style: AppStyles.styleMedium16(context),),
      ],
    ) ,
  );
}