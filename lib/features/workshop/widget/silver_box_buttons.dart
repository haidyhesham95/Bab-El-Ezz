import 'package:bab_el_ezz/features/workshop/widget/row_text_button.dart';
import 'package:flutter/material.dart';
import '../../../generated/assets.dart';
import '../../../shared_utils/styles/text.dart';
import 'divider.dart';

SliverToBoxAdapter silverBoxButtons(BuildContext context, {required bool showAll , required Function() onPressed}) {
    return  SliverToBoxAdapter(
      child: Column(
        children: [
          const SizedBox(height: 10,),
          Align(
            widthFactor: 5.8,
            alignment: Alignment.centerLeft,
            child: TextButton(
              style: TextButton.styleFrom(
              ),
              onPressed: onPressed,
              child: Text(
                  showAll ? 'رؤية الكل' : 'رؤية اقل',
                  style: AppStyles.styleRegular14(context).copyWith(color: Colors.white)
              ),
            ),
          ),
          divider(context),
          RowTextButton(
            text: 'المصروفات اليومية',
            assetName: Assets.imagesCash,
            onPressed: () {
              Navigator.pushNamed(context, 'dailyExpenses');
            },
          ),
          divider(context),
          RowTextButton(
            text: 'فاتورة قطع غيار جديدة',
            assetName: Assets.imagesReceipt,
            onPressed: () {
              Navigator.pushNamed(context, 'spareReceipt');
            },
          ),
        ],
      ),
    );

  }

