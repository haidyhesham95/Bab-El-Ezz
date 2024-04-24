import 'package:bab_el_ezz/features/staff/manager/staff_table/staff_table_cubit.dart';
import 'package:bab_el_ezz/features/staff/widget/item_staff_table.dart';
import 'package:bab_el_ezz/features/staff/widget/staff_data_table.dart';
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

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  StaffDataTable(
                    rows: cubit.items,
                    onPressed: () {
                      cubit.addItem(itemStaffTable(context,(){}));

                    }
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
