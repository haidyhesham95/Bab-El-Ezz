
import 'package:bab_el_ezz/features/workshop/work_shop/widget/silver_box_details.dart';
import 'package:bab_el_ezz/features/workshop/work_shop/widget/silver_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/work_shop/work_shop_cubit.dart';
import 'silver_box_buttons.dart';


class WorkShopBody extends StatelessWidget {
  const WorkShopBody({super.key,});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => WorkShopCubit(),

      child: BlocConsumer<WorkShopCubit, WorkShopState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          WorkShopCubit cubit = WorkShopCubit.get(context);


        return CustomScrollView(
            slivers: [
              const SilverBoxDetails(),
              SilverGrid(
                showAll: cubit.showAll,
              ),
              silverBoxButtons(
                context,
                showAll: cubit.showAll,
                onPressed: () {
                  cubit.toggleShowAll();
                },
              ),
            ],
          );
        },
        ),
    );
  }
}

