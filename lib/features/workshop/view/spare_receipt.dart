import 'package:bab_el_ezz/shared_utils/styles/colors.dart';
import 'package:bab_el_ezz/shared_utils/styles/text.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/button_widget.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/const_appbar.dart';
import 'package:flutter/material.dart';

class SpareReceipt extends StatelessWidget {
  const SpareReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: constAppBar(context, "فاتورة قطع غيار جديدة"),
      body:
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 25,
                        color: Colors.white,
                        child: Center(child: Text('...',style: AppStyles.styleSemiBold12(context),)),
                      ),
                    ),
                    SizedBox(width: 2),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 25,
                        color: ColorsAsset.kGreen,
                        child: Center(child: Text('مسلسل',style: AppStyles.styleSemiBold12(context).copyWith(color: Colors.white),)),
                      ),
                    ),
                    SizedBox(width: 2),

                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 25,

                        color: ColorsAsset.kGreen,
                        child: Center(child: Text('الصنف',style: AppStyles.styleSemiBold12(context).copyWith(color: Colors.white),)),
                      ),
                    ),
                    SizedBox(width: 2),

                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 25,

                        color: Colors.white,
                        child: Center(child: Text('الكمية',style: AppStyles.styleSemiBold12(context),)),
                      ),
                    ),
                    SizedBox(width: 2),

                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 25,

                        color: Colors.white,
                        child: Center(child: Text('المبلغ',style: AppStyles.styleSemiBold12(context),)),
                      ),
                    ),
                    SizedBox(width: 2),

                    Expanded(
                      flex: 4,
                      child: Container(
                        height: 25,
                        color: Colors.white,
                        child: Center(child: Text('ملاحظات',style: AppStyles.styleSemiBold12(context),)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 25,
                        color: Colors.white,
                        child: Center(child: Text('...',style: AppStyles.styleSemiBold12(context),)),
                      ),
                    ),
                    SizedBox(width: 2),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 25,
                        color: ColorsAsset.kGreen,
                        child: Center(child: Text('',style: AppStyles.styleSemiBold12(context).copyWith(color: Colors.white),)),
                      ),
                    ),
                    SizedBox(width: 2),

                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 25,

                        color: ColorsAsset.kGreen,
                        child: Center(child: Text('',style: AppStyles.styleSemiBold12(context).copyWith(color: Colors.white),)),
                      ),
                    ),
                    SizedBox(width: 2),

                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 25,

                        color: Colors.white,
                        child: Center(child: Text('',style: AppStyles.styleSemiBold12(context),)),
                      ),
                    ),
                    SizedBox(width: 2),

                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 25,

                        color: Colors.white,
                        child: Center(child: Text('',style: AppStyles.styleSemiBold12(context),)),
                      ),
                    ),
                    SizedBox(width: 2),

                    Expanded(
                      flex: 4,
                      child: Container(
                        height: 25,

                        color: Colors.white,
                        child: Center(child: Text('',style: AppStyles.styleSemiBold12(context).copyWith(color: Colors.black),)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 25,
                        color: Colors.white,
                        child: Center(child: Text('...',style: AppStyles.styleSemiBold12(context),)),
                      ),
                    ),
                    SizedBox(width: 2),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 25,
                        color: ColorsAsset.kGreen,
                        child: Center(child: Text('',style: AppStyles.styleSemiBold12(context).copyWith(color: Colors.white),)),
                      ),
                    ),
                    SizedBox(width: 2),

                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 25,

                        color: ColorsAsset.kGreen,
                        child: Center(child: Text('',style: AppStyles.styleSemiBold12(context).copyWith(color: Colors.white),)),
                      ),
                    ),
                    SizedBox(width: 2),

                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 25,

                        color: Colors.white,
                        child: Center(child: Text('',style: AppStyles.styleSemiBold12(context),)),
                      ),
                    ),
                    SizedBox(width: 2),

                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 25,

                        color: Colors.white,
                        child: Center(child: Text('',style: AppStyles.styleSemiBold12(context),)),
                      ),
                    ),
                    SizedBox(width: 2),

                    Expanded(
                      flex: 4,
                      child: Container(
                        height: 25,

                        color: Colors.white,
                        child: Center(child: Text('',style: AppStyles.styleSemiBold12(context).copyWith(color: Colors.black),)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1),

                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 25,
                        color: Colors.white,
                        child: Center(child: Text('...',style: AppStyles.styleSemiBold12(context),)),
                      ),
                    ),
                    SizedBox(width: 2),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 25,
                        color: ColorsAsset.kGreen,
                        child: Center(child: Text('',style: AppStyles.styleSemiBold12(context).copyWith(color: Colors.white),)),
                      ),
                    ),
                    SizedBox(width: 2),

                    Expanded(
                      flex: 5,
                      child: Container(
                        height: 25,
                        color: ColorsAsset.kGreen,
                        child: Center(child: Text('الاجمالي',style: AppStyles.styleSemiBold12(context).copyWith(color: Colors.white),)),
                      ),
                    ),
                    SizedBox(width: 2),
                    Expanded(
                      flex: 7,
                      child: Container(
                        height: 25,
                        color: Colors.white,
                        child: Center(child: Text('',style: AppStyles.styleSemiBold12(context),)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: ButtonWidget(
                    hasElevation: true,
                    text: 'طباعة فاتورة',
                    onPressed: () {},
                  ),
                ),
                SizedBox(width: 8),
                Flexible(
                  child: ButtonWidget(
                    hasElevation: true,
                    text: 'حفظ مؤقت',
                    onPressed: () {},
                  ),
                ),
                SizedBox(width: 8),
                Flexible(
                  child: ButtonWidget(
                    hasElevation: true,
                    text: 'انهاء الفاتورة',
                    onPressed: () {},
                  ),
                ),

              ]
            ),




          ],
        ),
      ),
    );
  }
}

