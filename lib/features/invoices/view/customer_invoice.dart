import 'package:bab_el_ezz/features/invoices/widget/customer_invoice_body.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/const_appbar.dart';
import 'package:flutter/material.dart';

class CustomerInvoice extends StatelessWidget {
  const CustomerInvoice({super.key ,});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: constAppBar(context, "فواتير العملاء"),
       body: const CustomerInvoiceBody(),

    );
  }
}
