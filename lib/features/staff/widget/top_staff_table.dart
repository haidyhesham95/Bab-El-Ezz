import 'package:bab_el_ezz/shared_utils/styles/colors.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/point_container.dart';

import '../../../shared_utils/styles/text.dart';
import '../../../shared_utils/utils/widget/white_container.dart';
import 'package:flutter/material.dart';

Padding topStaffTable(BuildContext context,void Function()? onPressed) {
  return  Padding(
    padding:  const EdgeInsets.symmetric(horizontal: 5),
    child: Row(
      children: [
        PointContainer(onPressed: onPressed,color: ColorsAsset.kGreen,text:'+',
          style: AppStyles.styleRegular20(context).copyWith(color: Colors.white),),
        const SizedBox(width: 1,),
        const WhiteContainer(text: 'اسم الفني'),
         const SizedBox(width: 1,),
         const WhiteContainer(text: 'الرقم القومي',),
         const SizedBox(width: 1,),
         const WhiteContainer(text: 'التخصص'),
         const SizedBox(width: 1,),
         const WhiteContainer(text: 'الدرجة الوظيفية',width: 70,),
         const SizedBox(width: 1,),
         const WhiteContainer(text: 'ملاحظات',width: 70,),
         const SizedBox(width: 1,),
        const WhiteContainer(text: 'تصفية حساب',width: 100,),
      ],
    ),
  );

}
