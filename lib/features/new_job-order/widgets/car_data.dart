import 'package:bab_el_ezz/data/car.dart';
import 'package:flutter/material.dart';

import '../../../shared_utils/utils/widget/row_text.dart';
import 'gray_container.dart';

class CarData extends StatelessWidget {
  final Car car;
  const CarData(this.car, {super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GrayContainer(
      padding: const EdgeInsets.only(right: 10),
      height: size.height * 0.25,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RowText(
                  'نوع السياره : ',
                  car.make,
                ),
                RowText('موديل السيارة : ',
                    car.model
                ),
                RowText(
                  'رقم الشاسيه : ',
                  car.chassisNumber,
                ),
                RowText(
                  'رقم لوحة السيارة : ',
                  car.licensePlate,
                ),
                const RowText(
                  'متوسط الاستهلاك الشهري : ',
                  "200",
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RowText(
                  'سنة الصنع : ',
                  car.year,
                ),
                RowText(
                  'للون السيارة : ',
                  car.color,
                ),
                RowText(
                  'رقم الموتور : ',
                  car.engineNumber,
                ),
                RowText(
                  'نوع ناقل الحركة : ',
                  car.transmissionType,
                ),
                const RowText(
                  ' ',
                  "",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
