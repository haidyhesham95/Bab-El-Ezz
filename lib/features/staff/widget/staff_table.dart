import 'package:bab_el_ezz/features/staff/manager/staff_table/staff_table_cubit.dart';
import 'package:bab_el_ezz/features/staff/widget/item_staff_table.dart';
import 'package:bab_el_ezz/features/staff/widget/top_staff_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StaffTable extends StatelessWidget {
  const StaffTable({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StaffTableCubit(),
      child: BlocBuilder<StaffTableCubit, StaffTableState>(
          builder: (context, state) {
        StaffTableCubit cubit = StaffTableCubit.get(context);

        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              topStaffTable(
                context,
                () {
                  cubit.add(
                      const ItemStaffTable()); // Use cubit.add method to add items
                },
              ),
              const SizedBox(
                height: 1,
              ),
              Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                     separatorBuilder: (context, index) => const SizedBox(height: 1),
                itemCount: cubit.items.length,
                itemBuilder: (context, index) => cubit.items[index],
              ))
            ]);
      }),
    );
  }
}
