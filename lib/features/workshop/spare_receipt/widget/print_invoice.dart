import 'package:bab_el_ezz/features/workshop/spare_receipt/widget/invoice_details_table.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/button_widget.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/row_text.dart';
import 'package:flutter/material.dart';

import '../../../../shared_utils/utils/widget/const_appbar.dart';
import '../../../new_job-order/widgets/gray_container.dart';

class PrintInvoice extends StatelessWidget {
  const PrintInvoice({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar:constAppBar(context,'طباعة فاتورة'),
      body:SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              const SizedBox(height: 20,),
              GrayContainer(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: size.height * 0.25,
                child:const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    RowText('اسم العميل :', "الاسم ..."),
                    RowText('نوع السيارة :', "النوع ..."),
                    RowText('موديل السيارة : ',"....."),
                    RowText('رقم لوحة السيارة : '  , " س ل م 123",),
                    RowText('وقت دخول السيارة : '  , "12pm",),
                    RowText('وقت خروج السيارة : '  , "1am",),
                  ],
                ),
              ),
              const SizedBox(height: 30,),

              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                  child: InvoiceDetailsTable()),
              const Spacer(flex: 2,),
              const ButtonWidget(
                hasElevation: true,
                text: 'طباعة',
              ),
              const Spacer(flex: 1,),

            ],
          ),
        ),
      ),
    );
  }
}
