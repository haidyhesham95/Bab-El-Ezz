import '../../../shared_utils/styles/colors.dart';
import '../../../shared_utils/styles/text.dart';
import '../../../shared_utils/utils/widget/white_container.dart';
import 'package:flutter/material.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/point_container.dart';


Padding  topSupplierTable (BuildContext context,void Function()? onPressed){
  return  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: Row(
      children: [
        PointContainer(onPressed: onPressed,color: ColorsAsset.kGreen,text:'+',
          style: AppStyles.styleRegular20(context).copyWith(color: Colors.white),),
        const SizedBox(width: 1,),
        const WhiteContainer(text: 'مسلسل'),
        const SizedBox(width: 1,),
        const WhiteContainer(text: 'الاسم',),
        const SizedBox(width: 1,),
        const WhiteContainer(text: 'رقم التليفون'),
        const SizedBox(width: 1,),
        const WhiteContainer(text: 'اسم الشركة'),
        const SizedBox(width: 1,),
        const WhiteContainer(text: 'عدد الفواتير'),
        const SizedBox(width: 1,),
        const WhiteContainer(text: 'اجمالي الفواتير',),
        const SizedBox(width: 1,),
        const WhiteContainer(text: 'اجمالي المدفوع'),
        const SizedBox(width: 1,),
        const WhiteContainer(text: 'اجمالي المتبقي'),
      ],
    ),
  );
}
