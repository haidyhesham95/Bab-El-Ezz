import 'package:bab_el_ezz/shared_utils/styles/colors.dart';
import 'package:bab_el_ezz/shared_utils/styles/text.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/button_widget.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/const_appbar.dart';
import 'package:flutter/material.dart';

import '../widget/spare_receipt_data.dart';

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
          children: [
            Expanded(
              child: ListView.builder(
               // padding: EdgeInsets.symmetric(horizontal: 5),
                itemCount: 1,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context ,index){
                  return SpareReceiptData();

                },
              ),
            ),
            //SizedBox(height: 50),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonWidget(
                    hasElevation: true,
                    text: 'طباعة فاتورة',
                    onPressed: () {},
                  ),
                  SizedBox(width: 8),
                  ButtonWidget(
                    hasElevation: true,
                    text: 'حفظ مؤقت',
                    onPressed: () {},
                  ),
                  SizedBox(width: 8),
                  ButtonWidget(
                    hasElevation: true,
                    text: 'انهاء الفاتورة',
                    onPressed: () {},
                  ),

                ]
              ),
            ),
            SizedBox(height: 50),




          ],
        ),
      ),
    );
  }
}

