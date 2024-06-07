import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../shared_utils/styles/colors.dart';
import '../../../../shared_utils/utils/widget/text_field.dart';
import '../../../new_job-order/widgets/drop_button.dart';

class AddItemsMerchantReturned extends StatelessWidget {
  const AddItemsMerchantReturned({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(color: ColorsAsset.kBrown,),
        SizedBox(height: 20,),
        TextFieldWidget(
          label: " الصنف ",
          hintText: " اضافه صنف ",
         // controller: cubit.merchantTypeController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.name,
          errorMessage: '(الصنف يجب ان يحتوي علي 3 احرف علي الاقل)',

        ),


        const SizedBox(height: 15),



        TextFieldWidget(
          label: " الكمية ",
          hintText: " كميه الصنف ",
        //  controller: cubit.merchantCountController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          errorMessage: '(الكمية يجب ان تكون ارقام فقط)',
        ),

        const SizedBox(height: 15,),
        TextFieldWidget(
          label: " السعر ",
          hintText: " اضافه السعر ",
        //  controller: cubit.merchantPriceController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          errorMessage: '(السعر يجب ان يحتوي علي ارقام فقط)',
        ),

        const SizedBox(height: 20),
        DropButton(
          hintText: 'الحالة',
         // value: cubit.selectedMerchantType,
          onChanged: (String? value) {
          //  cubit.setSelectedMerchantType(value);
          },
          items: const [
            DropdownMenuItem(
              value: 'استبدال',
              child: Text('استبدال'),
            ),

            DropdownMenuItem(
              value: 'مرتجع ',
              child: Text('مرتجع '),
            ),
          ],
        ),

        const SizedBox(height: 15,),

        TextFieldWidget(
          label: " المالحظات ",
          hintText: "اضافه ملاحظه ",
          maxLines: 3,
        //  controller: cubit.merchantNotesController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
        ),
        const SizedBox(height: 20,),


      ],
    );
  }
}
