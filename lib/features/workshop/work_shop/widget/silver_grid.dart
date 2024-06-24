import 'package:bab_el_ezz/data/job_order.dart';
import 'package:flutter/material.dart';

import 'car_item.dart';
import 'item_add_job_container.dart';

class SilverGrid extends StatelessWidget {
  const SilverGrid({
    super.key,
    required this.listJobs,
    this.showAll = false,
  });
  final bool showAll;
  final List<JobOrder> listJobs;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 25,
          mainAxisExtent: 100,
        ),
        delegate: SliverChildBuilderDelegate(
          childCount: listJobs.isEmpty ? 1 : listJobs.length + 1,
          (context, index) {
            if (index == listJobs.length || listJobs.isEmpty) {
              return itemAddJobContainer(context);
            } else {
              return carItem(context, listJobs[index]);
            }
          },
        ));
  }
}
