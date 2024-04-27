import 'package:bab_el_ezz/features/invoices/spare_invoices/widget/spare_invoices_body.dart';
import 'package:flutter/material.dart';

import '../../../../shared_utils/utils/widget/const_appbar.dart';

class SpareInvoices extends StatelessWidget {
  const SpareInvoices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: constAppBar(context, "فواتير قطع الغيار "),
      body: const SpareInvoicesBody(),

    );
  }
}
