import 'package:bab_el_ezz/features/invoices/maintenance_invoices/widget/maintenance_invoice_body.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/const_appbar.dart';
import 'package:flutter/material.dart';

class MaintenanceInvoices extends StatelessWidget {
  const MaintenanceInvoices({super.key ,});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: constAppBar(context, "فواتير الصيانة"),
       body: const MaintenanceInvoicesBody(),

    );
  }
}
