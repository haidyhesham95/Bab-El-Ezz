import 'package:bab_el_ezz/data/return_invoice.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/button_widget.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/const_appbar.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/text_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../new_job-order/widgets/drop_button.dart';
import '../manager/returned_invoices_cubit.dart';

class AddCustomerReturnedData extends StatefulWidget {
  const AddCustomerReturnedData({Key? key}) : super(key: key);

  @override
  _AddCustomerReturnedDataState createState() =>
      _AddCustomerReturnedDataState();
}

class _AddCustomerReturnedDataState extends State<AddCustomerReturnedData> {
  List<Widget> items = [];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: constAppBar(context, 'إضافة فاتورة'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: BlocProvider(
            create: (context) => ReturnedInvoicesCubit(),
            child: BlocConsumer<ReturnedInvoicesCubit, ReturnedInvoicesState>(
              listener: (context, state) {},
              builder: (context, state) {
                ReturnedInvoicesCubit cubit =
                    ReturnedInvoicesCubit.get(context);
                return Form(
                  key: cubit.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      TextFieldWidget(
                        label: " الصنف ",
                        hintText: " اضافه صنف ",
                        controller: cubit.nameController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        errorMessage:
                            '(الصنف يجب ان يحتوي علي 3 احرف علي الاقل)',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFieldWidget(
                        label: " الكمية ",
                        hintText: " كميه الصنف ",
                        controller: cubit.countController,
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
                        controller: cubit.priceController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        errorMessage: '(السعر يجب ان يحتوي علي ارقام فقط)',
                      ),
                      const SizedBox(height: 20),
                      DropButton(
                        hintText: 'الحالة',
                        value: cubit.selectedType,
                        onChanged: (String? value) {
                          cubit.setSelectedType(value);
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
                      const SizedBox(
                        height: 15,
                      ),
                      TextFieldWidget(
                        label: " الملاحظات ",
                        hintText: "اضافه ملاحظه ",
                        maxLines: 3,
                        controller: cubit.notesController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      const SizedBox(
                        height: 50,
                      ),
                      ButtonWidget(
                        hasElevation: true,
                        height: size.height * 0.05,
                        text: 'إضافة ',
                        onPressed: () {
                          if (kDebugMode ||
                              cubit.formKey.currentState!.validate()) {
                            ReturnInvoice invoice = ReturnInvoice(
                                part: cubit.nameController.text,
                                quantity: int.parse(cubit.countController.text),
                                price: double.parse(cubit.priceController.text),
                                status: cubit.selectedType,
                                notes: cubit.notesController.text);
                            Navigator.pop(context, invoice);
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
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
