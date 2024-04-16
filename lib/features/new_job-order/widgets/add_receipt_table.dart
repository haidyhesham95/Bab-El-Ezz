import 'package:bab_el_ezz/shared_utils/utils/widget/green_container.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/point_container.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/white_container.dart';
import 'package:flutter/material.dart';
import '../../../shared_utils/styles/text.dart';

class AddReceiptTable extends StatelessWidget {
  const AddReceiptTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
           children: [
             PointContainer(onPressed: (){}),
             const GreenContainer(text: 'الصنف',flex: 3),
             const WhiteContainer(text: 'الكمية'),
             const WhiteContainer(text: 'المبلغ'),
             WhiteContainer(text: 'ملاحظات',style: AppStyles.styleSemiBold12(context) ,flex: 3,),
          ]
        ),
        const Row(
            children: [
              PointContainer(text: '',),
              GreenContainer(text: '',flex: 3),
              WhiteContainer(text: ''),
              WhiteContainer(text: ''),
              WhiteContainer(text: '',flex: 3,),
            ]
        ),
        Row(
            children: [
              PointContainer(onPressed: (){}),
              const GreenContainer(text: 'اضافة صنف او خدمة',flex: 3),
              const WhiteContainer(text: ''),
              const WhiteContainer(text: ''),
              const WhiteContainer(text: '',flex: 3,),
            ]
        ),
        Row(
            children: [
              PointContainer(onPressed: (){}),
              const GreenContainer(text: 'المصنعية',flex: 3),
              const WhiteContainer(text: ''),
              const WhiteContainer(text: ''),
              const WhiteContainer(text: '',flex: 3,),
            ]
        ),
        Row(
            children: [
              PointContainer(onPressed: (){}),
              const GreenContainer(text: 'الخصم',flex: 3),
              const WhiteContainer(text: ''),
              const WhiteContainer(text: ''),
              const WhiteContainer(text: '',flex: 3,),
            ]
        ),
        Row(
            children: [
              PointContainer(onPressed: (){}),
              const GreenContainer(text: 'المصنعية',flex: 3),
              const WhiteContainer(text: ''),
              const WhiteContainer(text: ''),
              const WhiteContainer(text: '',flex: 3,),
            ]
        ),const Row(
            children: [
              PointContainer(text: '',),
              GreenContainer(text: 'الإجمالي',flex: 5),
              WhiteContainer(text: ''),
              WhiteContainer(text: '',flex: 3,),
            ]
        ),
      ],

    );
  }
}
