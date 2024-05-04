import 'package:bab_el_ezz/features/invoices/spare_invoices/widget/customer_spare_table.dart';
import 'package:bab_el_ezz/features/invoices/spare_invoices/widget/invoice_spare_table.dart';

import 'package:flutter/material.dart';

import '../../invoices/widget/top_invoice_search.dart';


class SpareInvoicesBody extends StatelessWidget {
  const SpareInvoicesBody({super.key});

  @override
  Widget build(BuildContext context) {
        return SingleChildScrollView(
          child: Column(
            children: [
              TopInvoicesSearch(
                onPressedSearch: (){},
              ),
              const InvoiceSpareTable( ),

              TopInvoicesSearch(
                onPressedSearch: (){},
                height: 70,
                text: " قائمة العملاء",
                hintText:  'البحث عن عميل'

              ),
              const CustomerSpareTable(
              )

            ],
          ),
        );

  }
}