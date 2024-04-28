import 'package:bab_el_ezz/shared_utils/utils/widget/data_text_field.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/text_field.dart';
import 'package:flutter/material.dart';
import '../../../shared_utils/styles/text.dart';
import '../../../shared_utils/utils/widget/row_text.dart';
import 'gray_container.dart';

class CarData extends StatelessWidget {
  const CarData({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return   GrayContainer(
      padding: const EdgeInsets.only(right: 12, left: 5),
      height:  size.height * 0.25,
      child: Row(
       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RowText('اسم العميل : ',"هايدي",),
                RowText('سنة الصنع : ',"2000",),
                RowText('رقم الشاشة : ',"456",),
                RowText('رقم لوحة السيارة : '  , "نوع",),



              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RowText('نوع السيارة : ',"نوع السيارة"),
              RowText('نوع ناقل الحركة : ',"نوع",),
              RowText('رقم الموتور : ',"25",),
              RowText('نوع الصيانة : ' , "نوع",),

            ],
          ),
        ],
      ),

    );

  }
}
