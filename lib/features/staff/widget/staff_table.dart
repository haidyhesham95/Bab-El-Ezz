import 'package:bab_el_ezz/features/staff/widget/item_staff_table.dart';
import 'package:bab_el_ezz/features/staff/widget/top_staff_table.dart';
import 'package:flutter/material.dart';

class StaffTable extends StatefulWidget {
  const StaffTable({super.key});

  @override
  State<StaffTable> createState() => _StaffTableState();
}

class _StaffTableState extends State<StaffTable> {
  List<Widget> items = [];

  @override
  Widget build(BuildContext context) {
       return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          SizedBox(height: 60),
          topStaffTable(context,() {
            setState(() {
              items.add(
                ItemStaffTable()
              );
            });
          },),
          const SizedBox(
            height: 1,
          ),
          Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 1,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) => items[index],
              ))

        ]
    );
  }
}
