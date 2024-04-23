import '../../../shared_utils/styles/text.dart';
import '../../../shared_utils/utils/widget/white_container.dart';
import 'package:flutter/material.dart';

Padding topDailyTable(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          const WhiteContainer(text: 'اسم الفني'),
          const SizedBox(width: 1,),
          const WhiteContainer(text: 'عمل/اجازة',),
          const SizedBox(width: 1,),
          const WhiteContainer(text: 'وقت الحضور'),
          const SizedBox(width: 1,),
          const WhiteContainer(text: 'وقت االانصراف',width: 70,),
          const SizedBox(width: 1,),
          const WhiteContainer(text: 'مكافأة'),
          const SizedBox(width: 1,),
          const WhiteContainer(text: 'خصم'),
          const SizedBox(width: 1,),
          const WhiteContainer(text: 'سلفة-مصروف',width: 70,),
          const SizedBox(width: 1,),
          WhiteContainer(text: 'ملاحظات',width: 70 ,),
          const SizedBox(width: 1,),
          WhiteContainer(text: 'تصفية حساب', width: 70,),
        ],
      ),
    );

  }

