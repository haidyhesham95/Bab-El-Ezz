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
              const SizedBox(height: 20,),
              const RowText("اسم العامل :", "الاسم ..."),
              const SizedBox(height: 20,),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
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
                        const SizedBox(height: 10,),

                        const RowText(' عمل /اجازة : ', "عمل"),
                        const RowText('وقت الحضور : ', "3:00pm."),
                        const RowText('وقت الانصراف : ', "3:00pm."),
                        const RowText('مكافأة : ', "...."),
                        const RowText('خصم : ', "...."),
                        const RowText('سلفة-مصروف : ', "...."),
                        const RowText('ملاحظات : ', "لايوجد"),
                        Text('تم تصفية الحساب',style: AppStyles.styleSemiBold16(context).copyWith(color: ColorsAsset.kGreen),),

                      ],
                    ),
                  );

                  }
              ),
              const SizedBox(height: 20,),

            ]
          ),
        ),
      ),
    );
  }
}
