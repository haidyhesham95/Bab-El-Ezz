import 'package:bab_el_ezz/features/workshop/widget/otp.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/button_widget.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/const_appbar.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/text_align.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/text_field.dart';
import 'package:flutter/material.dart';
import '../../../shared_utils/utils/widget/pay_container.dart';

class AddClient extends StatelessWidget {
  const AddClient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: constAppBar(context,' اضافة عميل جديد'),
      body: SingleChildScrollView
        (
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: Column(
            children: [
              const TextFieldWidget(
                label: " اسم العميل ",
                hint: " الاسم ",
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 10,),
              const TextFieldWidget(
                label: " رقم الهاتف الخاص بالواتس اب ",
                hint: " رقم الهاتف ",
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 10,),

              const TextFieldWidget(
                label: " نوع السيارة ",
                hint: " نوع السيارة ",
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 10,),
              const TextFieldWidget(
                label: " موديل السيارة ",
                hint: " موديل السيارة ",
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 10,),

              const TextFieldWidget(
                label: " لون السيارة ",
                hint: " لون السيارة ",
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 10,),

              const TextFieldWidget(
                label: " عداد الكيلو ميترات ",
                hint: " العداد ",
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 10,),

              const TextFieldWidget(
                label: " رقم الشاسية ",
                hint: " رقم الشاسية ",
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 10,),

              const TextFieldWidget(
                label: " رقم الموتور ",
                hint: " رقم الموتور ",
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 15),
              textAlign(context,' نوع ناقل الحركة '),
              const SizedBox(height: 15),
              const PayContainer( title: " مانوال "),
              const SizedBox(height: 10),
              const PayContainer(title: " اوتوماتيك "),
              const SizedBox(height: 15),
              textAlign(context,  ' رقم لوحة السيارة '),
              const SizedBox(height: 15),
              const PayContainer( title: " ارقام و حروف "),
              const SizedBox(height: 10),
              const PayContainer(title: " ارقام فقط "),
              const SizedBox(height: 20,),
              const Otp(),
              const SizedBox(height: 50,),
               ButtonWidget(
                text: 'اضافة عميل',
                hasElevation: true,
                onPressed: () {},

              )



            ],
          ),
        ),
      ),
    );
  }
}
