import 'package:bab_el_ezz/shared_utils/utils/widget/button_widget.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/const_appbar.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../new_job-order/widgets/drop_button.dart';
import '../manager/returned_invoices_cubit.dart';

class AddMerchantReturnedData extends StatelessWidget {
  const AddMerchantReturnedData({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: constAppBar(context,'إضافة فاتورة'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: BlocProvider(
            create: (context) => ReturnedInvoicesCubit(),
            child: BlocConsumer<ReturnedInvoicesCubit, ReturnedInvoicesState>(
              listener: (context, state) {},
              builder: (context, state) {
                ReturnedInvoicesCubit cubit = ReturnedInvoicesCubit.get(context);
                return Form(
                  key:cubit.formKey1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(height: 20),
                      DropButton(
                        hintText: ' اسم التاجر أور المورد ',
                        value: cubit.selectedMerchantName,
                        onChanged: (String? value) {
                          cubit.setSelectedMerchantName(value);
                        },
                        items: const [
                          DropdownMenuItem(
                            value: '1',
                            child: Text('1'),
                          ),
                          DropdownMenuItem(
                            value: '2 ',
                            child: Text('2 '),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      DropButton(
                        hintText: ' اسم الشركة',
                        value: cubit.selectedCompanyName,
                        onChanged: (String? value) {
                          cubit.setSelectedCompanyName(value);
                        },
                        items: const [
                          DropdownMenuItem(
                            value: ' 1',
                            child: Text(' الشركة1'),
                          ),

                          DropdownMenuItem(
                            value: '2',
                            child: Text(' الشركة2 '),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),



                      TextFieldWidget(
                        label: " الصنف ",
                        hintText: " اضافه صنف ",
                        controller: cubit.merchantTypeController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        errorMessage: '(الصنف يجب ان يحتوي علي 3 احرف علي الاقل)',

                      ),


                      const SizedBox(height: 15),



                      TextFieldWidget(
                        label: " الكمية ",
                        hintText: " كميه الصنف ",
                        controller: cubit.merchantCountController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        errorMessage: '(الكمية يجب ان تكون ارقام فقط)',
                      ),

                      const SizedBox(height: 15,),
                      TextFieldWidget(
                        label: " السعر ",
                        hintText: " اضافه السعر ",
                        controller: cubit.merchantPriceController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        errorMessage: '(السعر يجب ان يحتوي علي ارقام فقط)',
                      ),

                      const SizedBox(height: 20),
                      DropButton(
                        hintText: 'الحالة',
                        value: cubit.selectedMerchantType,
                        onChanged: (String? value) {
                          cubit.setSelectedMerchantType(value);
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

                      TextFieldWidget(
                        label: " المالحظات ",
                        hintText: "اضافه ملاحظه ",
                        maxLines: 3,
                        controller: cubit.merchantNotesController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                      ),





                      const SizedBox(height: 50,),
                      ButtonWidget(
                        hasElevation: true,
                        height: size.height * 0.05,
                        text: 'إضافة فاتورة',
                        onPressed: () {
                          if (cubit.formKey1.currentState!.validate()) {
                            Navigator.pop(context);
                          }

                        },

                      ),
                      const SizedBox(height: 20,),

                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}