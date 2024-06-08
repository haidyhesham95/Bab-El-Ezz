import 'package:bab_el_ezz/shared_utils/utils/widget/const_appbar.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/text_field.dart';
import 'package:flutter/material.dart';

import '../../../../shared_utils/utils/widget/button_widget.dart';

class AddCustomerInSpareInvoice extends StatelessWidget {
  const AddCustomerInSpareInvoice({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

              return Scaffold(
                appBar: constAppBar(
                  context,
                  'اضافة عميل',
                ),
                body: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        height: size.height,
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            // addImage(context, () {}, null),
                            // const SizedBox(height: 20),
                            TextFieldWidget(
                              label: " اسم العميل  : ",
                              hintText: " ادخال الاسم  ",
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              errorMessage:
                              '(الاسم يجب ان يحتوي علي 3 خانات)',
                            ),
                            const SizedBox(height: 20),
                            TextFieldWidget(
                              label: " رقم التلفون : ",
                              hintText: " +20 ",
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              errorMessage:
                              '(رقم الهاتف يجب ان يحتوي علي 11 خانات)',
                            ),
                            const SizedBox(height: 20),
                            Spacer(
                              flex: 3,
                            ),
                            ButtonWidget(
                              hasElevation: true,
                              height: size.height * 0.05,
                              text: ' إضافة  ',
                              onPressed: () {

                              },
                            ),
                            Spacer(
                            )
                          ],
                        ),
                      )),
                ),
              );
  }

}
