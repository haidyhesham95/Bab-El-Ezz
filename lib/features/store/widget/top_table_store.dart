import 'package:flutter/material.dart';
import '../../../shared_utils/utils/widget/white_container.dart';

Row topTableStore (BuildContext context) {
    return  const Row(
      children: [
        WhiteContainer(text: 'مسلسل'),
        SizedBox(width: 1),
        WhiteContainer(text: 'اسم الصنف', flex: 4,width: 70,),
        SizedBox(width: 1),
        WhiteContainer(text: 'كود الصنف', flex: 4,width: 70,),
        SizedBox(width: 1),
        WhiteContainer(text: 'الكمية'),
        SizedBox(width: 1),
        WhiteContainer(text: 'الماركة'),
        SizedBox(width: 1),
        WhiteContainer(text: 'سعر الجملة', flex: 4,width: 70,),
        SizedBox(width: 1),
        WhiteContainer(text: 'سعر البيع', flex: 3, width: 70,),
        SizedBox(width: 1),
        WhiteContainer(text: 'تنبيه'),
      ],
    );
  }

