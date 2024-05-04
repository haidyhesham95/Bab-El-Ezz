import 'package:bab_el_ezz/shared_utils/utils/widget/const_appbar.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared_utils/styles/text.dart';
import '../widget/data_raw_receipt_data.dart';
import '../manager/spare_receipt/spare_receipt_cubit.dart';
import '../widget/spare_receipt_button.dart';
import '../widget/spare_receipt_data.dart';

class SpareReceipt extends StatelessWidget {
  const SpareReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: constAppBar(context, "فاتورة قطع غيار جديدة"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: BlocProvider(
        create: (context) => SpareReceiptCubit(),
    child: BlocConsumer<SpareReceiptCubit, SpareReceiptState>(
    listener: (context, state) {},
    builder: (context, state) {
    SpareReceiptCubit cubit = SpareReceiptCubit.get(context);
    return  Column(
          children: [
             Expanded(
               child: SingleChildScrollView(
                 physics: const BouncingScrollPhysics(),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     const SizedBox(height: 20),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         TextFieldWidget(
                           height: size.height * 0.045,
                           label: ' اسم العميل :',
                           width: size.width * 0.4,
                           hintText: 'الاسم',
                           hintStyle: AppStyles.styleRegular10(context),
                           style: AppStyles.styleRegular10(context),
                           borderRadius: 4,
                           controller: cubit.nameController,
                           onChanged: (value) {},
                           keyboardType: TextInputType.text,


                         ),
                         TextFieldWidget(
                           height: size.height * 0.045,
                           label: 'رقم التلفون :',
                           width: size.width * 0.4,
                           hintText: 'الموجود عليه الواتساب',
                           hintStyle: AppStyles.styleRegular10(context),
                           style: AppStyles.styleRegular10(context),

                           borderRadius: 4,
                           controller: cubit.phoneController,
                           onChanged: (value) {},
                            keyboardType: TextInputType.number,

                         ),

                       ],
                     ),
                     const SizedBox(height: 20),
                     SingleChildScrollView(
                       scrollDirection: Axis.horizontal,
                       child: SpareReceiptData(
                       rows: cubit.items,
                       onPressed:(){

                    cubit.addItem(dataRowReceiptData(context));

                         }
                       ),
                     ),
                     const SizedBox(height: 20),
                   ],
                 ),
               ),
             ),
            const SpareReceiptButtons(),
            const SizedBox(height: 15),
          ],
    );
    }

        ),
      ),
      )
    );
  }
}


