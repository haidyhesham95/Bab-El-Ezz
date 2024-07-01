import 'package:bab_el_ezz/data/workshop.dart';
import 'package:flutter/material.dart';

import '../../../../generated/assets.dart';
import '../../../../shared_utils/styles/text.dart';
import '../../../../shared_utils/utils/widget/row_text.dart';

class SilverBoxDetails extends StatelessWidget {
  const SilverBoxDetails(this.workshop, {super.key});
  final Workshop workshop;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            workshop.logoPath != null &&
                    (workshop.logoPath?.isNotEmpty ?? false)
                ? Image.network(
                    workshop.logoPath!,
                    fit: BoxFit.scaleDown,
                    width: size.width * 0.35,
                    height: size.width * 0.35,
                  )
                : Image.asset(Assets.imagesCarservices),
            const SizedBox(
              height: 10,
            ),
            RowText(
              'اسم المركز : ',
              workshop.name,
              textStyle: AppStyles.styleExtraBold15(context),
              dataStyle: AppStyles.styleExtraBold13(context),
            ),
            const SizedBox(
              height: 10,
            ),
            workshop.branch != null && (workshop.branch?.isNotEmpty ?? false)
                ? RowText(
                    'اسم الفرع  : ',
                    workshop.branch,
                    textStyle: AppStyles.styleExtraBold15(context),
                    dataStyle: AppStyles.styleExtraBold13(context),
                  )
                : Container(),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
