
import 'package:bab_el_ezz/shared_utils/utils/widget/button_widget.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/const_appbar.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/customer_invoice/customer_invoice_cubit.dart';
import 'add_image.dart';

class AddCustomer extends StatelessWidget {
  const AddCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: constAppBar(context,' اضافة عميل'),
      body: SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: BlocProvider(
              create: (context) => CustomerInvoiceCubit(),
              child: BlocConsumer<CustomerInvoiceCubit, CustomerInvoiceState>(
                listener: (context, state) {},
                builder: (context, state) {
                  CustomerInvoiceCubit cubit = CustomerInvoiceCubit.get(context);
                  return Form(
                    key:cubit.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(height: 20),

                        addImage(context, ),
                        const SizedBox(height: 20),
                        TextFieldWidget(
                          label: " اسم العميل ",
                          hintText: "  اسم العميل ",
                          controller: cubit.customerNameController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                        ),

                        const SizedBox(height: 15,),
                        TextFieldWidget(
                          label: " رقم الفاتوره ",
                          hintText: " رقم الفاتوره ",
                          controller: cubit.invoiceNumberController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                        ),

                        const SizedBox(height: 15,),
                        TextFieldWidget(
                          label: " رقم التلفون ",
                          hintText: " رقم التلفون ",
                          controller: cubit.phoneNumberController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 15,),

                        TextFieldWidget(
                          label: " ماركه السياره",
                          hintText: "   ماركه السياره ",
                          controller: cubit.cartModelController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                        ),
                        const SizedBox(height: 15,),
                        TextFieldWidget(
                          label: " رقم اللوحه ",
                          hintText: " رقم اللوحه ",
                          controller: cubit.cartNumberController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                        ),

                        const SizedBox(height: 50,),
                        ButtonWidget(
                          hasElevation: true,
                          height: size.height * 0.05,
                          // width: size.width * 0.7,
                          text: 'اضافة عميل',
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