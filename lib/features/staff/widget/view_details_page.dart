import 'package:bab_el_ezz/shared_utils/utils/widget/const_appbar.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/row_text.dart';
import 'package:flutter/material.dart';

import '../../../shared_utils/styles/colors.dart';
import '../../../shared_utils/styles/text.dart';
import '../../new_job-order/widgets/gray_container.dart';

class ViewDetailsPage extends StatelessWidget {
  const ViewDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: constAppBar(context, 'عرض التفاصيل'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              RowText("اسم العامل :", "الاسم ..."),
              SizedBox(height: 20,),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => const SizedBox(height: 15),
                itemCount: 6,
                  itemBuilder: (context, index){
                  return GrayContainer(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: size.height * 0.40,
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Align(
                          alignment: Alignment.center,
                            child: Text('التاريخ',style: AppStyles.styleSemiBold16(context),)),
                        SizedBox(height: 10,),

                        RowText(' عمل /اجازة : ', "عمل"),
                        RowText('وقت الحضور : ', "3:00pm."),
                        RowText('وقت الانصراف : ', "3:00pm."),
                        RowText('مكافأة : ', "...."),
                        RowText('خصم : ', "...."),
                        RowText('سلفة-مصروف : ', "...."),
                        RowText('ملاحظات : ', "لايوجد"),
                        Text('تم تصفية الحساب',style: AppStyles.styleSemiBold16(context).copyWith(color: ColorsAsset.kGreen),),

                      ],
                    ),
                  );

                  }
              ),
              SizedBox(height: 20,),

            ]
          ),
        ),
      ),
    );
  }
}
