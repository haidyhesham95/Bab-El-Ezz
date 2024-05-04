import 'package:bab_el_ezz/features/invoices/returned_invoices/widget/returned_invoices_body.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/const_appbar.dart';
import 'package:flutter/material.dart';

class ReturnedInvoices extends StatelessWidget {
  const ReturnedInvoices({super.key ,});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: constAppBar(context, "فواتير مرتجع قطع غيار"),
      body: const ReturnedInvoiceBody(),

    );
  }
}