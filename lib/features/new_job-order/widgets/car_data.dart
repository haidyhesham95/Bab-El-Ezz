import 'package:flutter/material.dart';
import '../../../shared_utils/utils/widget/row_text.dart';
import 'gray_container.dart';

class CarData extends StatelessWidget {
  const CarData({super.key});

  @override
  Widget build(BuildContext context) {
    return  const GrayContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RowText('نوع السيارة : ',"نوع السيارة"),
              RowText('سنة الصنع : ',"2000",),
              RowText('نوع ناقل الحركة : ',"نوع",),
              RowText('رقم الشاشة : ',"456",),
              RowText('رقم لوحة السيارة : '  , "نوع",),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RowText('اسم العميل : ',"هايدي",),
              RowText('عدد الكيلومترات : ',"1500",),
              RowText('لون السيارة : ',"احمر",),
              RowText('رقم الموتور : ',"25",),
              RowText('نوع الصيانة : ' , "نوع",)
            ],
          ),
        ],
      ),

    );

  }
}
