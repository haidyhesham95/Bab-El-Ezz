import '../../../shared_utils/utils/widget/white_container.dart';
import 'package:flutter/material.dart';

Padding topDailyTable(BuildContext context) {
    return  const Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          WhiteContainer(text: 'اسم الفني'),
          SizedBox(width: 1,),
          WhiteContainer(text: 'عمل/اجازة',),
          SizedBox(width: 1,),
          WhiteContainer(text: 'وقت الحضور'),
          SizedBox(width: 1,),
          WhiteContainer(text: 'وقت االانصراف',width: 70,),
          SizedBox(width: 1,),
          WhiteContainer(text: 'مكافأة'),
          SizedBox(width: 1,),
          WhiteContainer(text: 'خصم'),
          SizedBox(width: 1,),
          WhiteContainer(text: 'سلفة-مصروف',width: 70,),
          SizedBox(width: 1,),
          WhiteContainer(text: 'ملاحظات',width: 70 ,),
          SizedBox(width: 1,),
          WhiteContainer(text: 'تصفية حساب', width: 70,),
        ],
      ),
    );

  }

