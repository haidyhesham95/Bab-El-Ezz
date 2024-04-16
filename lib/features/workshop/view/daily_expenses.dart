 import 'package:bab_el_ezz/shared_utils/styles/colors.dart';
import 'package:bab_el_ezz/shared_utils/styles/text.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/const_appbar.dart';
import 'package:flutter/material.dart';

class  DailyExpenses extends StatelessWidget {
   const  DailyExpenses({super.key});

   @override
   Widget build(BuildContext context) {
     return  Scaffold(
       appBar: constAppBar(context, "المصروفات اليومية"),
        body:
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: (){},
                      child: Container(
                        height: 25,
                        color: Colors.white,
                        child: Center(child: Text('...',style: AppStyles.styleSemiBold12(context),)),
                      ),
                    ),
                  ),
                  SizedBox(width: 2),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 25,
                      color: ColorsAsset.kGreen,
                      child: Center(child: Text('البند',style: AppStyles.styleSemiBold12(context).copyWith(color: Colors.white),)),
                    ),
                  ),
                  SizedBox(width: 2),

                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 25,

                      color: Colors.white,
                      child: Center(child: Text('المبلغ',style: AppStyles.styleSemiBold12(context),)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 1),

              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 25,
                      color: Colors.white,
                      child: Center(child: Text('...',style: AppStyles.styleSemiBold12(context),)),
                    ),
                  ),
                  SizedBox(width: 2),

                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 25,
                      color: ColorsAsset.kGreen,
                      child: Center(child: Text('',style: AppStyles.styleSemiBold12(context).copyWith(color: Colors.white),)),
                    ),
                  ),
                  SizedBox(width: 2),

                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 25,

                      color: Colors.white,
                      child: Center(child: Text('',style: AppStyles.styleSemiBold12(context),)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 1),

              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 25,
                      color: Colors.white,
                      child: Center(child: Text('...',style: AppStyles.styleSemiBold12(context),)),
                    ),
                  ),
                  SizedBox(width: 2),

                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 25,
                      color: ColorsAsset.kGreen,
                      child: Center(child: Text('',style: AppStyles.styleSemiBold12(context).copyWith(color: Colors.white),)),
                    ),
                  ),
                  SizedBox(width: 2),

                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 25,

                      color: Colors.white,
                      child: Center(child: Text('',style: AppStyles.styleSemiBold12(context),)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 1),
              Row(
                children: [

                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 25,
                      color: ColorsAsset.kGreen,
                      child: Center(child: Text('الاجمالي',style: AppStyles.styleSemiBold12(context).copyWith(color: Colors.white),)),
                    ),
                  ),
                  SizedBox(width: 2),

                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 25,

                      color: Colors.white,
                      child: Center(child: Text('',style: AppStyles.styleSemiBold12(context),)),
                    ),
                  ),
                ],
              ),



            ],
          ),
        ),
     );
   }
 }





