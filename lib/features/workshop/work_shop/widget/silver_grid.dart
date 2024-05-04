import 'package:flutter/material.dart';

import 'grid_item.dart';
import 'item_add_job_container.dart';

class SilverGrid extends StatelessWidget {
  const SilverGrid({super.key , this.showAll = false, });
 final  bool showAll;
  final int itemCount = 4;


  @override
  Widget build(BuildContext context) {
    return SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 25,
          mainAxisExtent: 100,
        ),
        delegate: SliverChildBuilderDelegate(
          childCount: itemCount,
              (context, index) {
            if (showAll && index > 1) {
              return null;
            }

            if (index == itemCount - 1)
            {
              return itemAddJobContainer(context);
            }
            else {
              return gridItem(context);
            }
          },
        ));
  }
}
