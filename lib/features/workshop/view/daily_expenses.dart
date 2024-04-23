import 'package:bab_el_ezz/features/workshop/widget/daily_expenses_data.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/const_appbar.dart';

import 'package:flutter/material.dart';

class  DailyExpenses extends StatelessWidget {
   const  DailyExpenses({super.key});

   @override
   Widget build(BuildContext context) {
     var width = MediaQuery.of(context).size.width;
     var height = MediaQuery.of(context).size.height;
     return  Scaffold(
       appBar: constAppBar(context, "المصروفات اليومية"),
        body:
        ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          itemCount: 1,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context ,index){
            return const DailyExpensesData();
          },
           )




     );
   }
 }





