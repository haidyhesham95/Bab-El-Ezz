import 'package:bab_el_ezz/features/invoices/returned_invoices/widget/customer_returned_table.dart';
import 'package:flutter/material.dart';

import 'merchant_returned_table.dart';

class ReturnedInvoiceBody extends StatelessWidget {
  const ReturnedInvoiceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        CustomerReturnedTable(),
        MerchantReturnedTable(),
      ],
    ));
  }
}
