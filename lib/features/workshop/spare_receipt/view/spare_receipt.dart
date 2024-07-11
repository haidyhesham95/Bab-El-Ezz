import 'package:bab_el_ezz/features/new_job-order/widgets/gray_container.dart';
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
          return  SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SizedBox(
        height: size.height,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            GrayContainer(
              height: size.height * 0.33,

              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFieldWidget(
                    height: size.height * 0.06,

                    label: ' اسم العميل :',
                    hintText: 'الاسم',
                    hintStyle: AppStyles.styleRegular10(context),
                    style: AppStyles.styleRegular10(context),
                    borderRadius: 4,
                    controller: cubit.nameController,
                    onChanged: (value) {},
                    keyboardType: TextInputType.text,


                  ),
                  TextFieldWidget(
                    height: size.height * 0.06,
                    label: 'رقم التلفون :',
                    hintText: 'الموجود عليه الواتساب',
                    hintStyle: AppStyles.styleRegular10(context),
                    style: AppStyles.styleRegular10(context),

                    borderRadius: 4,
                    controller: cubit.phoneController,
                    onChanged: (value) {},
                     keyboardType: TextInputType.number,

                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'addCustomer');

                    },
                    child: Text('اضافه عميل',style: AppStyles.styleRegular14(context).copyWith(color: Colors.white),),
                  ),



                ],
              ),
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
           const Spacer(flex: 3,),
            const SpareReceiptButtons(),
           const Spacer()
          ],
        ),
      ),
          );
          }

        ),
      ),
      )
    );
  }
}


