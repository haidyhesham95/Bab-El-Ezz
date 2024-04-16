import 'package:bab_el_ezz/features/invoices/widget/list_item_supplier.dart';
import 'package:bab_el_ezz/features/invoices/widget/sliver_box_list_supplier.dart';
import 'package:bab_el_ezz/features/invoices/widget/custom_sliver_list.dart';
import 'package:bab_el_ezz/features/invoices/widget/sliver_box_list_supplier_invoice.dart';
import 'package:flutter/material.dart';
import 'list_item_supplier_invoice.dart';

class SupplierInvoicesBody extends StatefulWidget {
  const SupplierInvoicesBody({super.key});

  @override
  State<SupplierInvoicesBody> createState() => _SupplierInvoicesBodyState();
}

class _SupplierInvoicesBodyState extends State<SupplierInvoicesBody> {
  List<Widget> items = [];
  List<Widget> items1 = [];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        sliverBoxListSupplierInvoice(
          onPressedSearch: (){},
          context,
          onPressed: (){
            setState(() {
              items1.add(
                  ListItemSupplierInvoice(onPressed: (){})
              );
            });
          },
        ),
        CustomSliverList(
            items: items1
        ),


        sliverBoxListSupplier(
          onPressedSearch: (){},
          context,
          onPressed: (){
            setState(() {
              items.add(
                   ListItemSupplier(onPressed: (){})
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
