import 'package:bab_el_ezz/shared_utils/utils/widget/green_container.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/point_container.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/white_container.dart';
import 'package:flutter/material.dart';

import '../../../shared_utils/styles/text.dart';

class DailyExpensesData extends StatelessWidget {
  const DailyExpensesData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        Row(
          children: [
            PointContainer(
              onPressed: (){},
            ),
            const SizedBox(width: 1),
            const GreenContainer(text: 'البند',width: 100,),
            const SizedBox(width: 1),
            WhiteContainer(flex: 3,text: 'المبلغ',style: AppStyles.styleSemiBold12(context),width: 400,)
          ],
        ),


        const SizedBox(height: 1),

        Row(
          children: [
            PointContainer(
              onPressed: (){},
            ),
            const SizedBox(width: 1),
            const GreenContainer(text: '',width: 100),
            const SizedBox(width: 1),
            const WhiteContainer(flex: 3,text: 'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh',width: 400,)
          ],
        ),
        const SizedBox(height: 1),

        const Row(
          children: [
            GreenContainer(text: 'الاجمالي',flex: 3,width: 151,),
            SizedBox(width: 1),
            WhiteContainer(flex: 3,text: '1000',width: 400,)
          ],
        ),
      ],
    );
  }
}
