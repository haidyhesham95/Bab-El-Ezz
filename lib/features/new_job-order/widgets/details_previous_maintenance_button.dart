import 'package:flutter/material.dart';

import '../../../shared_utils/styles/colors.dart';
import '../../../shared_utils/styles/text.dart';
import '../../../shared_utils/utils/widget/text_align.dart';

class DetailsPreviousMaintenanceButton extends StatelessWidget {
  const DetailsPreviousMaintenanceButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => PreviousMaintenanceType(
        //         pastOrders: cubit.pastOrders,
        //       ),
        //     ));
      },
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        textAlign(
          context,
          'تفاصيل الصيانات السابقة',
          style: AppStyles.styleMedium16(context)
              .copyWith(color: ColorsAsset.kGreen),
        ),
        const Icon(
          Icons.arrow_forward_ios_outlined,
          color: ColorsAsset.kGreen,
        )
      ]),
    );
  }
}
