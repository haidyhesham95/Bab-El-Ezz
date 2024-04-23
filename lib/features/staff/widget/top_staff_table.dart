import 'package:bab_el_ezz/shared_utils/styles/colors.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/point_container.dart';

import '../../../shared_utils/styles/text.dart';
import '../../../shared_utils/utils/widget/white_container.dart';
import 'package:flutter/material.dart';

Padding topStaffTable(BuildContext context,void Function()? onPressed) {
  return  Padding(
    padding:  EdgeInsets.symmetric(horizontal: 5),
    child: Row(
      children: [
        PointContainer(onPressed: onPressed,color: ColorsAsset.kGreen,text:'+',
          style: AppStyles.styleRegular20(context).copyWith(color: Colors.white),),
        SizedBox(width: 1,),
        WhiteContainer(text: 'اسم الفني'),
         SizedBox(width: 1,),
         WhiteContainer(text: 'الرقم القومي',),
         SizedBox(width: 1,),
         WhiteContainer(text: 'التخصص'),
         SizedBox(width: 1,),
         WhiteContainer(text: 'الدرجة الوظيفية',width: 70,),
         SizedBox(width: 1,),
         WhiteContainer(text: 'ملاحظات',width: 70,),
         SizedBox(width: 1,),
        WhiteContainer(text: 'تصفية حساب',width: 100,),
      ],
    ),
  );

}
