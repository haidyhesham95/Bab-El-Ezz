import 'package:bab_el_ezz/features/invoices/maintenance_invoices/widget/maintenance_customer_table.dart';
import 'package:bab_el_ezz/features/invoices/maintenance_invoices/widget/maintenance_invoices_table.dart';
import 'package:flutter/material.dart';

import '../../invoices/widget/top_invoice_search.dart';

class MaintenanceInvoiceBody extends StatelessWidget {
  const MaintenanceInvoiceBody({super.key});


  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
            child: Column(
              children: [

                TopInvoicesSearch(
                  onPressedSearch: (){},
                ),
                const MaintenanceInvoiceTable() ,

                TopInvoicesSearch(
                  onPressedSearch: (){},
                  hintText: ' بحث عن عميل ',
                  text: ' قائمة العملاء',
                  height: 70,
                ),

                MaintenanceCustomerTable(),

              ],
            )

          );

  }
}
