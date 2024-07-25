import 'package:bab_el_ezz/features/invoices/returned_invoices/manager/returned_invoices_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared_utils/utils/widget/text_field.dart';
import '../../../new_job-order/widgets/drop_button.dart';

/// 0 -> name
/// 1 -> quantity
/// 2 -> price
/// 3 -> notes
AddItemsMerchantReturned(
  List<TextEditingController> controllers,
  ReturnedInvoicesCubit cubit,
  List<String> statuses,
  int index,
) {
  print("status: ${statuses[index]}");
  return Column(
    children: [
      const SizedBox(
        height: 20,
      ),
      TextFieldWidget(
        label: " الصنف ",
        hintText: " اضافه صنف ",
        controller: controllers[0],
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.name,
        errorMessage: '(الصنف يجب ان يحتوي علي 3 احرف علي الاقل)',
      ),
      const SizedBox(height: 15),
      TextFieldWidget(
        label: " الكمية ",
        hintText: " كميه الصنف ",
        controller: controllers[1],
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.number,
        errorMessage: '(الكمية يجب ان تكون ارقام فقط)',
      ),
      const SizedBox(
        height: 15,
      ),
      TextFieldWidget(
        label: " السعر ",
        hintText: " اضافه السعر ",
        controller: controllers[2],
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.number,
        errorMessage: '(السعر يجب ان يحتوي علي ارقام فقط)',
      ),
      const SizedBox(height: 20),
      BlocBuilder<ReturnedInvoicesCubit, ReturnedInvoicesState>(
        builder: (context, state) {
          return DropButton(
            hintText: 'الحالة',
            value: statuses[index],
            onChanged: (String? value) {
              statuses[index] = value!;
              //Call the callback to update the statuses list
              context.read<ReturnedInvoicesCubit>().update();
            },
            items: const [
              DropdownMenuItem(
                value: 'استبدال',
                child: Text('استبدال'),
              ),
              DropdownMenuItem(
                value: 'مرتجع',
                child: Text('مرتجع'),
              ),
            ],
          );
        },
      ),
      const SizedBox(
        height: 15,
      ),
      TextFieldWidget(
        label: " الملاحظات ",
        hintText: "اضافه ملاحظه ",
        maxLines: 3,
        controller: controllers[3],
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.text,
      ),
      const SizedBox(
        height: 20,
      ),
    ],
  );
}
