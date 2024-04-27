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
        appBar: constAppBar(context, ' اضافة منتج'),
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
                            hintText: "  اسم الصنف ",
                            controller: cubit.typeNameController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                          ),
                          const SizedBox(height: 15),
                          TextFieldWidget(
                            label: " كود الصنف ",
                            hintText: " كود الصنف ",
                            controller: cubit.typeNumberController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(height: 15),
                          TextFieldWidget(
                            label: " الكمية ",
                            hintText: " الكمية ",
                            controller: cubit.quantityController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 15),
                          TextFieldWidget(
                            label: " ماركه السياره",
                            hintText: "   ماركه السياره ",
                            controller: cubit.brandController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                          ),
                          const SizedBox(height: 15),
                          TextFieldWidget(
                            label: " سعر الجملة ",
                            hintText: " سعر الجملة ",
                            controller: cubit.priceController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 15),
                          TextFieldWidget(
                            label: " سعر البيع ",
                            hintText: " سعر البيع ",
                            controller: cubit.saleNumberController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 15),
                          TextFieldWidget(
                            label: " تنبيه ",
                            hintText: " تنبيه ",
                            controller: cubit.alertController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
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
                                Navigator.pop(context);
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
