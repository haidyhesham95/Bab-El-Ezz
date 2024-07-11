import 'package:bab_el_ezz/data/job_order.dart';
import 'package:bab_el_ezz/features/workshop/work_shop/widget/silver_box_details.dart';
import 'package:bab_el_ezz/features/workshop/work_shop/widget/silver_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/work_shop/work_shop_cubit.dart';
import 'silver_box_buttons.dart';

class WorkShopBody extends StatelessWidget {
  WorkShopBody({
    super.key,
  });

  late List<JobOrder> listJobs = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkShopCubit(),
      child: BlocConsumer<WorkShopCubit, WorkShopState>(
        listener: (context, state) {},
        builder: (context, state) {
          print("state: $state");
          WorkShopCubit cubit = WorkShopCubit.get(context);
          if (state is WorkShopInitial) {
            cubit.getCurrentJobs();
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetData) {
            listJobs = state.data;
          }

          return CustomScrollView(
            slivers: [
              cubit.workshop != null
                  ? SilverBoxDetails(cubit.workshop!)
                  : const SliverToBoxAdapter(child: SizedBox.shrink()),
              SilverGrid(
                listJobs: listJobs,
                showAll: cubit.showAll,
                onTap: (index) async {
                  JobOrder? order = await Navigator.pushNamed(
                      context, 'newJobOrderPage',
                      arguments: listJobs[index]) as JobOrder?;
                  print("index: $index");
                  print("order2: ${order?.toJson()}");
                  cubit.updateOrder(listJobs[index], order);
                },
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
