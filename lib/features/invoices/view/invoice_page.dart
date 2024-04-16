import 'package:bab_el_ezz/features/invoices/widget/invoice_body.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/appbar_widget.dart';
import 'package:flutter/material.dart';


class InvoicePage extends StatelessWidget {
 const  InvoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context),
      body: InvoiceBody(context: context,),
    );
  }
}


