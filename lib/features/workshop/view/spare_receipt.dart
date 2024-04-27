import 'package:bab_el_ezz/shared_utils/utils/widget/button_widget.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/const_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../invoices/manager/supplier_invoice/supplier_invoice_cubit.dart';
import '../manager/spare_receipt_cubit.dart';
import '../widget/data_raw_receipt_data.dart';
import '../widget/spare_receipt_data.dart';

class SpareReceipt extends StatelessWidget {
  const SpareReceipt({super.key});

  @override
  Widget build(BuildContext context) {
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
                physics: BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SpareReceiptData(
                      rows: cubit.items,
                      onPressed:(){

                   cubit.addItem(dataRowReceiptData(context));

                        }
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ButtonWidget(
                    hasElevation: true,
                    text: 'طباعة فاتورة',
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ButtonWidget(
                    hasElevation: true,
                    text: 'حفظ مؤقت',
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ButtonWidget(
                    hasElevation: true,
                    text: 'انهاء الفاتورة',
                    onPressed: () {},
                  ),
                ),
              ],
            ),
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


