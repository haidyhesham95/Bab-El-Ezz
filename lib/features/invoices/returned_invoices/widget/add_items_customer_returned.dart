import 'package:flutter/material.dart';

import '../../../../shared_utils/styles/colors.dart';
import '../../../../shared_utils/utils/widget/text_field.dart';
import '../../../new_job-order/widgets/drop_button.dart';

class AddItemsCustomerReturned extends StatelessWidget {
  const AddItemsCustomerReturned({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        const Divider(color: ColorsAsset.kBrown,),
        const SizedBox(height: 20),
        const TextFieldWidget(
          label: " الصنف ",
          hintText: " اضافه صنف ",
          // controller: cubit.typeController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.name,
          errorMessage: '(الصنف يجب ان يحتوي علي 3 احرف علي الاقل)',

        ),

        const SizedBox(height: 15,),
        const TextFieldWidget(
          label: " الكمية ",
          hintText: " كميه الصنف ",
          // controller: cubit.countController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          errorMessage: '(الكمية يجب ان تكون ارقام فقط)',
        ),

        const SizedBox(height: 15,),
        const TextFieldWidget(
          label: " السعر ",
          hintText: " اضافه السعر ",
          //  controller: cubit.priceController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          errorMessage: '(السعر يجب ان يحتوي علي ارقام فقط)',
        ),

        const SizedBox(height: 20),
        DropButton(
          hintText: 'الحالة',
          // value: cubit.selectedType,
          onChanged: (String? value) {
            //    cubit.setSelectedType(value);
          },
          items: const [
            DropdownMenuItem(
              value: 'سليم',
              child: Text('سليم'),
            ),
            DropdownMenuItem(
              value: 'تالف وسيتم استبداله ',
              child: Text('تالف وسيتم استبداله '),
            ),
            DropdownMenuItem(
              value: 'تالف ولن يتم استبداله ',
              child: Text('تالف ولن يتم استبداله '),
            ),
          ],
        ),

        const SizedBox(height: 15,),

        const TextFieldWidget(
          label: " المالحظات ",
          hintText: "اضافه ملاحظه ",
          maxLines: 3,
          //  controller: cubit.notesController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
        ),

        const SizedBox(height: 20,),

      ],
    );
  }
}
