import 'package:flutter/material.dart';
import '../../../generated/assets.dart';
import '../../../shared_utils/styles/text.dart';
import '../../../shared_utils/utils/widget/row_text.dart';

class SilverBoxDetails extends StatelessWidget {
  const SilverBoxDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return  SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(Assets.imagesCarservices),
            const SizedBox(
              height: 10,
            ),
            RowText(
              'اسم المركز : ',
              'hhhhh',
              textStyle: AppStyles.styleExtraBold15(context),
              dataStyle: AppStyles.styleExtraBold13(context),
            ),
            const SizedBox(
              height: 10,
            ),
            RowText(
              'اسم الفرع  : ',
              'hhhhh',
              textStyle: AppStyles.styleExtraBold15(context),
              dataStyle: AppStyles.styleExtraBold13(context),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

