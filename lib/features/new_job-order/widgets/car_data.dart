import 'package:flutter/material.dart';
import '../../../shared_utils/utils/widget/row_text.dart';
import 'gray_container.dart';

class CarData extends StatelessWidget {
  const CarData({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return   GrayContainer(
      padding: const EdgeInsets.only(right: 10),
      height:  size.height * 0.25,
      child: const Row(
       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RowText('نوع السياره : ',"نوع السياره",),
                RowText('موديل السيارة : ',"موديل السيارة"),
                RowText('رقم الشاشة : ',"456",),
                RowText('رقم لوحة السيارة : '  , " س ل م 123",),
                RowText('متوسط الاستهلاك الشهري : '  , "200",),




              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RowText('سنة الصنع : ',"2000",),
              RowText('للون السيارة : : ',"ابيض ",),
              RowText('رقم الموتور : ',"25",),
              RowText('نوع ناقل الحركة : ',"نوع",),
              RowText(' '  , "",),
            ],
          ),
        ],
      ),

    );

  }
}
