import 'package:bab_el_ezz/shared_utils/utils/widget/point_container.dart';
import 'package:flutter/material.dart';
import '../../../shared_utils/styles/text.dart';
import '../../../shared_utils/utils/widget/button_widget.dart';
import '../../../shared_utils/utils/widget/white_container.dart';

class ItemStaffTable extends StatelessWidget {
  const ItemStaffTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
       PointContainer(onPressed: (){},),
      const SizedBox(
        width: 1,
      ),

      const WhiteContainer(text: ''),
      const SizedBox(
        width: 1,
      ),
      const WhiteContainer(text: ''),
      const SizedBox(
        width: 1,
      ),
      const WhiteContainer(text: ''),
      const SizedBox(
        width: 1,
      ),
      const WhiteContainer(
        text: '',
        width: 70,
      ),
      const SizedBox(
        width: 1,
      ),
      const WhiteContainer(text: '',width: 70,),
      const SizedBox(
        width: 1,
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        height: 25,
        width: 100,
        color: Colors.white,
        child: Center(
            child: ButtonWidget(
              height: 22,
              onPressed: () {
                Navigator.of(context).pushNamed('accountClearancePage');

              },
              text: 'عرض التفاصيل',
              fontStyle: AppStyles.styleRegular8(context),
              borderRadius: 4,
            )),
      ),
    ]);
  }
}
