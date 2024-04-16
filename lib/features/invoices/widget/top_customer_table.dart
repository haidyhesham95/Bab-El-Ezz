import '../../../shared_utils/styles/colors.dart';
import '../../../shared_utils/styles/text.dart';
import '../../../shared_utils/utils/widget/white_container.dart';
import 'package:flutter/material.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/point_container.dart';


  Padding  topCustomerTable (BuildContext context,void Function()? onPressed){
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          PointContainer(onPressed: onPressed,color: ColorsAsset.kGreen,text:'+',
            style: AppStyles.styleRegular20(context).copyWith(color: Colors.white),),
          SizedBox(width: 1,),
          WhiteContainer(text: 'مسلسل'),
          SizedBox(width: 1,),
          WhiteContainer(text: 'رقم الفاتورة',),
          SizedBox(width: 1,),
          WhiteContainer(text: 'التاريخ'),
          SizedBox(width: 1,),
          WhiteContainer(text: 'اسم العميل'),
          SizedBox(width: 1,),
          WhiteContainer(text: 'رقم التليفون'),
          SizedBox(width: 1,),
          WhiteContainer(text: 'ماركة السيارة',),
          SizedBox(width: 1,),
          WhiteContainer(text: 'رقم اللوحة'),
          SizedBox(width: 1,),
          WhiteContainer(text: 'صورة الفاتورة'),
        ],
      ),
    );
  }
