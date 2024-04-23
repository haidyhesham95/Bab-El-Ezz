import 'package:bab_el_ezz/shared_utils/utils/widget/green_container.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/white_container.dart';
import 'package:flutter/material.dart';

import '../../../shared_utils/styles/text.dart';
import '../../../shared_utils/utils/widget/point_container.dart';

class SpareReceiptData extends StatelessWidget {
  const SpareReceiptData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            PointContainer(
              onPressed: () {},
            ),
            const SizedBox(width: 1),
            const GreenContainer(text: 'مسلسل'),
            const SizedBox(width: 1),
            const GreenContainer(text: 'الصنف'),
            const SizedBox(width: 1),
            const WhiteContainer(
              width: 70,
              flex: 3,
              text: 'الكمية',
            ),
            const SizedBox(width: 1),
            const WhiteContainer(
              width: 70,
              text: 'المبلغ',
              flex: 3,
            ),
            const SizedBox(width: 1),
            const WhiteContainer(
              width: 70,
              text: 'ملاحظات',
              flex: 4,
            )
          ],
        ),
        const SizedBox(height: 1),
        Row(
          children: [
            PointContainer(
              onPressed: () {},
            ),
            const SizedBox(width: 1),
            const GreenContainer(text: ''),
            const SizedBox(width: 1),
            const GreenContainer(text: ''),
            const SizedBox(width: 1),
            const WhiteContainer(
              flex: 3,
              text: '',
              width: 70,

            ),
            const SizedBox(width: 1),
            const WhiteContainer(
              width: 70,

              text: '',
              flex: 3,
            ),
            const SizedBox(width: 1),
            const WhiteContainer(
              width: 70,
              text: '',
              flex: 4,
            )
          ],
        ),
        const SizedBox(height: 1),
        Row(
          children: [
            PointContainer(
              onPressed: () {},
            ),
            const SizedBox(width: 1),
            const GreenContainer(text: ''),
            const SizedBox(width: 1),
            GreenContainer(
              width: 121,
              text: 'الاجمالي',
              style: AppStyles.styleSemiBold12(context)
                  .copyWith(color: Colors.white),
              flex: 5,
            ),
            const SizedBox(width: 1),
            const WhiteContainer(
              width: 141,
              text: "",
              flex: 7,
            )
          ],
        ),
      ],
    );
  }
}
