import 'package:bab_el_ezz/features/invoices/manager/supplier_invoice/supplier_invoice_cubit.dart';
import 'package:bab_el_ezz/features/invoices/widget/list_item_supplier.dart';
import 'package:bab_el_ezz/features/invoices/widget/sliver_box_list_supplier.dart';
import 'package:bab_el_ezz/features/invoices/widget/custom_sliver_list.dart';
import 'package:bab_el_ezz/features/invoices/widget/sliver_box_list_supplier_invoice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'list_item_supplier_invoice.dart';

class SupplierInvoicesBody extends StatelessWidget {
  const SupplierInvoicesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SupplierInvoiceCubit(),
      child: BlocConsumer<SupplierInvoiceCubit, SupplierInvoiceState>(
        listener: (context, state) {},
        builder: (context, state) {
          SupplierInvoiceCubit cubit = SupplierInvoiceCubit.get(context);
          return CustomScrollView(
            slivers: [
              sliverBoxListSupplierInvoice(
                onPressedSearch: () {},
                context,
                onPressed: () {
                  cubit.addInvoiceItem(
                      ListItemSupplierInvoice(onPressed: () {}));
                },
              ),
              CustomSliverList(items: cubit.invoicesItems),
              sliverBoxListSupplier(
                onPressedSearch: () {},
                context,
                onPressed: () {
                  cubit.addSupplierItem(ListItemSupplier(onPressed: () {}));
                },
              ),
              CustomSliverList(items: cubit.suppliersItems),
            ],
          );
        },
      ),
    );
  }
}
