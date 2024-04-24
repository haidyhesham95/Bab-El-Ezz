import 'package:bab_el_ezz/features/workshop/widget/daily_expenses_data.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/const_appbar.dart';

import 'package:flutter/material.dart';

class  DailyExpenses extends StatelessWidget {
   const  DailyExpenses({super.key});

   @override
   Widget build(BuildContext context) {
     return  Scaffold(
       appBar: constAppBar(context, "المصروفات اليومية"),
        body:const SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DailyExpensesData()),
                ],
              ),
            ),
          ),
        )




     );
   }
 }





