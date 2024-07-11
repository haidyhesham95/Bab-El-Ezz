import 'package:bab_el_ezz/features/data%20analysis/view/customer_opinions/widget/customer_cards.dart';
import 'package:bab_el_ezz/features/data%20analysis/view/customer_opinions/widget/customer_date.dart';
import 'package:flutter/material.dart';

class CustomerOpinions  extends StatelessWidget {
  const CustomerOpinions ({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body:Center(
        child: Column(
          children: [
            SizedBox(height: 30,),

            CustomerDate(),
            SizedBox(height: 30,),
            CustomerCards()
          ],
        ),
      )
    );
  }
}
