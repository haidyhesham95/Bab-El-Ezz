import 'package:bab_el_ezz/shared_utils/utils/widget/shadow_container.dart';
import 'package:flutter/material.dart';

import '../../../../shared_utils/styles/colors.dart';
import '../../../../shared_utils/styles/text.dart';
import 'invoice_body.dart';

Widget buildItem(CategoryItem item,  context) {
  return Card(
    elevation: 5,
    shadowColor: ColorsAsset.kGreen,
    child: ShadowContainer(
      onTap: item.onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            item.icon,
            Text(
              item.label,
              style: AppStyles.styleExtraBold13(context).copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],

      ),
    ),
  );
}
