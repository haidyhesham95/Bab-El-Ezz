import 'package:bab_el_ezz/features/invoices/widget/list_item_customer.dart';
import 'package:bab_el_ezz/features/invoices/widget/sliver_box_list_customer.dart';
import 'package:bab_el_ezz/features/invoices/widget/sliver_box_list_invoice.dart';
import 'package:bab_el_ezz/features/invoices/widget/custom_sliver_list.dart';
import 'package:bab_el_ezz/features/invoices/widget/sliver_list_invoice.dart';
import 'package:flutter/material.dart';

import '../../staff/widget/item_staff_table.dart';
class CustomerInvoiceBody extends StatefulWidget {
  const CustomerInvoiceBody({super.key});

  @override
  State<CustomerInvoiceBody> createState() => _CustomerInvoiceBodyState();
}

class _CustomerInvoiceBodyState extends State<CustomerInvoiceBody> {
  List<Widget> items = [];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        sliverBoxListInvoice(
          context,
          onPressedSearch: (){},
        ),

        const SliverListInvoice() ,
        sliverBoxListCustomer(
          onPressedSearch: (){},
          context,
          onPressed: (){
            setState(() {
              items.add(
                   ListItemCustomer(onPressed: (){},)
              );
            });
          },
        ),
         CustomSliverList(
          items: items
        ),
      ],
    );
  }
}
