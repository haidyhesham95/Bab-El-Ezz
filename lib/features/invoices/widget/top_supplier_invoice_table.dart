import '../../../shared_utils/styles/colors.dart';
import '../../../shared_utils/styles/text.dart';
import '../../../shared_utils/utils/widget/white_container.dart';
import 'package:flutter/material.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/point_container.dart';


Padding  topSupplierInvoiceTable (BuildContext context,void Function()? onPressed){
  return  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: Row(
      children: [
        PointContainer(onPressed: onPressed,color: ColorsAsset.kGreen,text:'+',
          style: AppStyles.styleRegular20(context).copyWith(color: Colors.white),),
        const SizedBox(width: 1,),
        const WhiteContainer(text: 'مسلسل'),
        const SizedBox(width: 1,),
        const WhiteContainer(text: 'اسم المورد',),
        const SizedBox(width: 1,),
        const WhiteContainer(text: 'التاريخ'),
        const SizedBox(width: 1,),
        const WhiteContainer(text: 'رقم الفاتورة'),
        const SizedBox(width: 1,),
        const WhiteContainer(text: 'اجمالي الفاتورة'),
        const SizedBox(width: 1,),
        const WhiteContainer(text: 'المدفوع',),
        const SizedBox(width: 1,),
        const WhiteContainer(text: 'الاجل'),
        const SizedBox(width: 1,),
        const WhiteContainer(text: 'تاريخ الاستحقاق'),
        const SizedBox(width: 1,),
        const WhiteContainer(text: 'صورة الفاتورة'),
      ],
    ),
  );
}
