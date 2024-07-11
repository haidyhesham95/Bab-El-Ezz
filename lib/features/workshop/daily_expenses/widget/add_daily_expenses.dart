import 'package:bab_el_ezz/data/daily_expense.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared_utils/utils/widget/const_appbar.dart';
import '../../../../shared_utils/utils/widget/text_field.dart';
import '../manager/daily_expenses_cubit.dart';

class AddDailyExpenses extends StatelessWidget {
  AddDailyExpenses({super.key});

  bool isUpdate = false;
  DailyExpense? dailyExpense;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: constAppBar(
          context,
          ' اضافة فاتوره',
        ),
        body: BlocProvider(
          create: (context) => DailyExpensesCubit(),
          child: BlocConsumer<DailyExpensesCubit, DailyExpensesState>(
            listener: (context, state) {},
            builder: (context, state) {
              DailyExpensesCubit cubit = DailyExpensesCubit.get(context);

              if (state is DailyExpensesInitial) {
                dailyExpense =
                    ModalRoute.of(context)?.settings.arguments as DailyExpense?;
                if (dailyExpense != null && !isUpdate) {
                  cubit.bandController.text = dailyExpense!.item;
                  cubit.priceController.text = dailyExpense!.price.toString();
                }
              }
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: size.height,
                width: size.width,
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      TextFieldWidget(
                        label: " البند ",
                        hintText: " اضافه البند ",
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        errorMessage: 'الرجاء ادخال البند',
                        controller: cubit.bandController,
                      ),
                      const SizedBox(height: 15),
                      TextFieldWidget(
                        label: " المبلغ ",
                        hintText: "اضافه المبلغ ",
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        controller: cubit.priceController,
                        errorMessage: 'الرجاء ادخال المبلغ',
                      ),
                      //SizedBox(height: 50,),
                      const Spacer(),
                      ButtonWidget(
                          hasElevation: true,
                          text: 'اضافه',
                          onPressed: () {
                            if (cubit.formKey.currentState!.validate()) {
                              Navigator.pop(
                                  context,
                                  DailyExpense(
                                      cubit.bandController.text,
                                      double.parse(cubit.priceController.text),
                                      DateTime.now()));
                            }
                          }),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
