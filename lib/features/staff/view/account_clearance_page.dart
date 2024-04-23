import 'package:bab_el_ezz/features/new_job-order/widgets/gray_container.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/button_widget.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/const_appbar.dart';
import 'package:flutter/material.dart';

import '../../../shared_utils/utils/widget/row_text.dart';

class AccountClearancePage extends StatelessWidget {
  const AccountClearancePage({super.key});

  @override
  Widget build(BuildContext context) {
    final  size = MediaQuery.of(context).size ;
        return Scaffold(
      appBar: constAppBar(context, 'تصفية الحساب'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            GrayContainer(
              height:size.height * 0.45,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RowText('اسم العامل  : ',"اسم العامل "),
                  RowText('اخر تاريخ تصفية   : ',"2000",),
                  RowText('عدد ايام العمل : ',"عدد",),
                  RowText('اجمالي المكافئات  : ',"456",),
                  RowText('عدد ايام الاجازات : '  , "8888",),
                  RowText('جمالي السلف و المصروف : ',"333",),
                  RowText('ااجمالي الخصومات  : ',"456",),
                  RowText('المبلغ المستحق  : '  , "88888",),

                ],
              ),


            ) ,
            ButtonWidget(
              hasElevation: true,
              text: "تصفية حساب",
              onPressed: () {},
            )
          ],
        ),
      )
    );
  }
}
