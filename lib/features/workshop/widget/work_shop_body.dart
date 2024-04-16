import 'package:bab_el_ezz/features/workshop/widget/silver_box_buttons.dart';
import 'package:bab_el_ezz/features/workshop/widget/silver_box_details.dart';
import 'package:bab_el_ezz/features/workshop/widget/silver_grid.dart';
import 'package:flutter/material.dart';


class WorkShopBody extends StatefulWidget {
  const WorkShopBody({super.key,});

  @override
  State<WorkShopBody> createState() => _WorkShopBodyState();
}

class _WorkShopBodyState extends State<WorkShopBody> {
  late bool showAll = false;

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
        slivers: [
          const SilverBoxDetails(),
          SilverGrid(
            showAll: showAll,
          ),
          silverBoxButtons(
            context,
            showAll: showAll,
            onPressed: () {
              setState(() {
                showAll = !showAll;
              });
            },
          ),
        ],
    );
  }
}

