import 'package:flutter/material.dart';

import '../../../shared_utils/utils/widget/point_container.dart';
import '../../../shared_utils/utils/widget/white_container.dart';

Padding topInvoiceTable (context) {
  return const Padding(
    padding: EdgeInsets.symmetric(horizontal: 5),
    child: Row(
      children: [
        PointContainer(text: "", color: Colors.transparent,),
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