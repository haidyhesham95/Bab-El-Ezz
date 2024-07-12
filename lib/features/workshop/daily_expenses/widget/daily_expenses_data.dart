import 'package:bab_el_ezz/data/daily_expense.dart';
import 'package:bab_el_ezz/features/workshop/daily_expenses/manager/daily_expenses_cubit.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared_utils/utils/widget/drop_menu.dart';

class DailyExpensesData extends StatelessWidget {
  const DailyExpensesData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DailyExpensesCubit(),
      child: BlocBuilder<DailyExpensesCubit, DailyExpensesState>(
        builder: (context, state) {
          DailyExpensesCubit cubit = DailyExpensesCubit.get(context);

          if (state is DailyExpensesInitial) {
            cubit.getExpenses();
            return const CircularProgressIndicator();
          }

          return CustomDataTable(
            columns: [
              DataColumn(
                  label: IconButton(
                      onPressed: () async {
                        DailyExpense expense = await Navigator.pushNamed(
                            context, "addDailyExpenses") as DailyExpense;
                        cubit.addExpense(expense);
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ))),
              const DataColumn(label: Text('البند')),
              const DataColumn(label: Text('المبلغ')),
            ],
            rows: [
              ...List.generate(
                cubit.dailyExpenses.length,
                (index) => DataRow(
                  cells: <DataCell>[
                    DataCell(DropMenu(
                      index: index,
                      onTapEdit: (index) async {
                        DailyExpense expense = await Navigator.pushNamed(
                                context, "addDailyExpenses",
                                arguments: cubit.dailyExpenses[index])
                            as DailyExpense;
                        cubit.updateExpense(expense);
                      },
                      onTapDelete: (index) {
                        cubit.deleteExpense(cubit.dailyExpenses[index]);
                      },
                    )),
                    DataCell(Text(cubit.dailyExpenses[index].item)),
                    // Replace with actual item data
                    DataCell(Text(cubit.dailyExpenses[index].price.toString())),
                  ],
                ),
              ),
              DataRow(
                cells: <DataCell>[
                  const DataCell(Text(
                    'الاجمالي',
                  )),
                  const DataCell(Text('')), // Empty cell for alignment
                  DataCell(Text(cubit.total.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold))),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
