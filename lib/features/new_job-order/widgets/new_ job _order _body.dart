import 'package:bab_el_ezz/shared_utils/utils/widget/pay_container.dart';
import 'package:bab_el_ezz/shared_utils/styles/colors.dart';
import 'package:bab_el_ezz/shared_utils/styles/text.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/text_align.dart';
import 'package:flutter/material.dart';
import '../../../generated/assets.dart';
import '../../../shared_utils/utils/widget/button_widget.dart';
import '../../../shared_utils/utils/widget/text_field.dart';
import '../../workshop/widget/add_button.dart';
import 'add_receipt_table.dart';
import 'car_data.dart';
import 'details.dart';
import 'drop_button.dart';

class NewJobOrderBody extends StatelessWidget {
  const NewJobOrderBody({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return
      SingleChildScrollView(
          child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child:Column(
          children: [
            const Details(),
            const SizedBox(height: 20),
            const CarData(),
            const SizedBox(height: 20),
            DropButton(
              hintText: 'نوع الصيانة',
           //   value: ,
              onChanged: (String? value) {  },
              items: const [
                  DropdownMenuItem(value: 'صيانه اعطال', child: Text('صيانه اعطال'),
                  ),
                  DropdownMenuItem(value: 'صيانه اعطال', child: Text('صيانه اعطاله'),
                  ),
                  DropdownMenuItem(value: 'مرتجع', child: Text('مرتجع'),
                  ),

              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Flexible(
                  child: DropButton(
                    hintText:'اضافة فني للسيارة' ,
                    //   value: ,
                    onChanged: (String? value) {  },
                    items: const [
                      DropdownMenuItem(value: 'اضافة فني', child: Text('اضافة فني '),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
               AddButton(onPressed: (){},)
              ],
            ),
            const SizedBox(height: 20),
            Image.asset(
              Assets.imagesCars,
            ),
            const SizedBox(height: 20),
            TextFieldWidget(
              height: size.height * 0.09,
              label: " اضافة ملاحظات ",
              titleStyle: AppStyles.styleMedium18(context),
              hintStyle: AppStyles.styleSemiBold14(context),
              style: AppStyles.styleSemiBold14(context).copyWith(color: Colors.black),
              hint: "ملاحظات..",
              maxLines: 3,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              color: ColorsAsset.kDarkGray,

            ),
            const SizedBox(height: 10),

            textAlign(context,  'اضافة فاتورة',),
            const SizedBox(height: 15),
             const AddReceiptTable(),
            const SizedBox(height: 20),
            textAlign(context, 'تحديد طريقة الدفع'),
            const SizedBox(height: 15),
            const PayContainer( title: "دفع كاش"),
            const SizedBox(height: 10),
            const PayContainer(title: "دفع الكتروني "),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonWidget(
                  hasElevation: true,
                  text: "حفظ مؤقت",
                  onPressed: () {},
                  width: size.width * 0.4,
                ),
                ButtonWidget(
                  hasElevation: true,
                  text: "انهاء امر الشغل",
                  onPressed: () {},
                  width: size.width * 0.4,
                ),

              ],
            ),
          ],
    ))

    );
  }
}
