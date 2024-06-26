import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared_utils/utils/widget/button_widget.dart';
import '../../../shared_utils/utils/widget/const_appbar.dart';
import '../../../shared_utils/utils/widget/text_field.dart';
import '../manager/store/store_cubit.dart';

class AddsItemsStore extends StatelessWidget {
  const AddsItemsStore({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: constAppBar(context, 'اضافة صنف'),
        body: BlocProvider(
            create: (context) => StoreCubit(),
            child: BlocConsumer<StoreCubit, StoreState>(
                listener: (context, state) {},
                builder: (context, state) {
                  final cubit = StoreCubit.get(context);
                  return SingleChildScrollView(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Form(
                      key: cubit.formKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          TextFieldWidget(
                            label: " اسم الصنف ",
                            hintText: "  ادخال اسم الصنف ",
                            controller: cubit.nameController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                            errorMessage: 'الرجاء ادخال اسم الصنف',
                          ),
                          const SizedBox(height: 15),
                          TextFieldWidget(
                            label: " كود الصنف ",
                            hintText: " ادخال كود الصنف ",
                            controller: cubit.codeController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            errorMessage: 'الرجاء ادخال كود الصنف',
                          ),
                          const SizedBox(height: 15),
                          TextFieldWidget(
                            label: " الكمية ",
                            hintText: " اضافه الكمية ",
                            controller: cubit.quantityController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            errorMessage: 'الرجاء ادخال الكمية',
                          ),
                          const SizedBox(height: 15),
                          TextFieldWidget(
                            label: " الماركة ",
                            hintText: " ادخال الماركة  ",
                            controller: cubit.brandController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                            errorMessage: 'الرجاء ادخال الماركة ',
                          ),
                          const SizedBox(height: 15),
                          TextFieldWidget(
                            label: " سعر الجملة ",
                            hintText: " اضافه سعر الجملة ",
                            controller: cubit.priceController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            errorMessage: 'الرجاء ادخال سعر الجملة',
                          ),
                          const SizedBox(height: 15),
                          TextFieldWidget(
                            label: " سعر البيع ",
                            hintText: " اضافه  سعر البيع ",
                            controller: cubit.salePriceController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            errorMessage: 'الرجاء ادخال سعر البيع',
                          ),
                          const SizedBox(height: 15),
                          TextFieldWidget(
                            label: " تنبيه عند وصول الكميه  ",
                            hintText: " اضافه تنبيه ",
                            controller: cubit.alertController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                            errorMessage: 'الرجاء ادخال تنبيه',
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          ButtonWidget(
                            hasElevation: true,
                            height: size.height * 0.05,
                            // width: size.width * 0.7,
                            text: ' اضافة ',
                            onPressed: () {
                              if (cubit.formKey.currentState!.validate()) {
                                cubit.addPart().then(
                                    (value) => Navigator.pop(context, value));
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ));
                })));
  }
}
