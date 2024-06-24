import 'package:bab_el_ezz/features/invoices/spare_invoices/widget/customer_spare_table.dart';
import 'package:bab_el_ezz/features/invoices/spare_invoices/widget/invoice_spare_table.dart';
import 'package:flutter/material.dart';

class SpareInvoicesBody extends StatelessWidget {
  const SpareInvoicesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          InvoiceSpareTable(),
          CustomerSpareTable(),
        ],
      ),
    );
  }
}
