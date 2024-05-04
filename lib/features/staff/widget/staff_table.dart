
import 'package:bab_el_ezz/features/staff/widget/staff_data_table.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/floating_button.dart';
import 'package:flutter/material.dart';


class StaffTable extends StatelessWidget {
  const StaffTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,

        floatingActionButton: floatingButton(context: context, onPressed: () {
          Navigator.of(context).pushNamed('addStaffItem');
        }, text: 'اضافة عامل',),

        body:const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  StaffDataTable( ),
                ],
              ),
            ),
          ),
      ) );
  }
}
