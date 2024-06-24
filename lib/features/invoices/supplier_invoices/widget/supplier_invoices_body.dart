import 'package:bab_el_ezz/features/invoices/supplier_invoices/widget/invoice_supplier_table.dart';
import 'package:bab_el_ezz/features/invoices/supplier_invoices/widget/supplier_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/supplier_invoice/supplier_invoice_cubit.dart';

class SupplierInvoicesBody extends StatefulWidget {
  const SupplierInvoicesBody({super.key});

  @override
  State<SupplierInvoicesBody> createState() => _SupplierInvoicesBodyState();
}

class _SupplierInvoicesBodyState extends State<SupplierInvoicesBody> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InvoiceCubit(),
      child: BlocConsumer<InvoiceCubit, InvoiceState>(
        listener: (context, state) {},
        builder: (context, state) {
          InvoiceCubit cubit = InvoiceCubit.get(context);
          return SingleChildScrollView(
            child: Column(
              children: [
                InvoicesSuppliersTable(),
                SupplierTable(),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
