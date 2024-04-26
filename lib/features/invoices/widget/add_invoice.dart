
import 'package:bab_el_ezz/shared_utils/utils/widget/button_widget.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/const_appbar.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../new_job-order/widgets/drop_button.dart';
import '../manager/supplier_invoice/supplier_invoice_cubit.dart';
import 'add_image.dart';

class AddInvoices extends StatelessWidget {
  const AddInvoices({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: constAppBar(context,' اضافة فاتوره'),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: BlocProvider(
              create: (context) => SupplierInvoiceCubit(),
              child: BlocConsumer<SupplierInvoiceCubit, SupplierInvoiceState>(
                listener: (context, state) {},
                builder: (context, state) {
                  SupplierInvoiceCubit cubit = SupplierInvoiceCubit.get(context);
                  return Form(
                    key:cubit.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(height: 20),

                        addImage(context, ),
                        const SizedBox(height: 20),


                        DropButton(
                          hintText: 'اسم المورد',

                          value: cubit.selectedSupplierType,
                          onChanged: (String? value) {
                            cubit.setSelectedSupplierType(value);
                          },
                          items: const [
                            DropdownMenuItem(
                              value: 'مورد1',
                              child: Text('مورد1'),
                            ),
                            DropdownMenuItem(
                              value: 'مورد2',
                              child: Text('مورد2'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15,),
                        TextFieldWidget(
                          label: " رقم الفاتوره ",
                          hintText: " رقم الفاتوره ",
                          controller: cubit.supplierNameController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                        ),

                       const SizedBox(height: 50,),
                        ButtonWidget(
                          height: size.height * 0.05,
                         // width: size.width * 0.7,
                          text: 'اضافة فاتوره',
                          hasElevation: true,
                          onPressed: () {
                            if (cubit.formKey.currentState!.validate()) {
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