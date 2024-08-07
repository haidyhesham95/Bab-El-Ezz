import 'package:bab_el_ezz/data/job_order.dart';
import 'package:flutter/material.dart';

import '../../../../shared_utils/styles/text.dart';
import '../../../../shared_utils/utils/widget/shadow_container.dart';

ShadowContainer carItem(context, JobOrder jobOrder, Function() onTap) {
  return ShadowContainer(
    radius: 10,
    onTap: onTap,
    colorShadow: jobOrder.car?.colorAsColor,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          jobOrder.car?.make ?? '',
          style: AppStyles.styleMedium16(context),
        ),
        Text(
          jobOrder.car!.licensePlate!,
          style: AppStyles.styleMedium16(context),
        ),
      ],
    ),
  );
}
