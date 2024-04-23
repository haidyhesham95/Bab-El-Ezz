import 'package:bab_el_ezz/features/invoices/widget/supplier_invoices_body.dart';
import 'package:flutter/material.dart';

import '../../../shared_utils/utils/widget/const_appbar.dart';

class SupplierInvoices extends StatelessWidget {
  const SupplierInvoices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: constAppBar(context, "فواتير الموردين"),
      body: const SupplierInvoicesBody(),

    );
  }
}
