import 'package:flutter/material.dart';

import '../../../shared_utils/utils/widget/action_button.dart';
import '../../../shared_utils/utils/widget/const_appbar.dart';
import '../../../shared_utils/utils/widget/text_field.dart';

class AddDailyExpenses extends StatelessWidget {
  const AddDailyExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: constAppBar(context, ' اضافة فاتوره', actions: [
      actionButton( context, () {
      })
    ]),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextFieldWidget(
              label: " البند ",
              hintText: " اضافه البند ",
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              errorMessage: 'الرجاء ادخال البند',
            ),
            const SizedBox(height: 15 ),
            TextFieldWidget(
              label: " المبلغ ",
              hintText: "اضافه المبلغ ",
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              errorMessage: 'الرجاء ادخال المبلغ',
            ),

          ],
        ),
      ),

    );
  }
}
