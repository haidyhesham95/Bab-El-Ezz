import 'package:bab_el_ezz/features/invoices/supplier_invoices/widget/invoice_supplier_table.dart';
import 'package:bab_el_ezz/features/invoices/supplier_invoices/widget/supplier_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared_utils/utils/widget/show_details_text.dart';
import '../../invoices/widget/top_invoice_search.dart';
import '../manager/supplier_invoice/supplier_invoice_cubit.dart';

class SupplierInvoicesBody extends StatefulWidget {
  const SupplierInvoicesBody({super.key});

  @override
  State<SupplierInvoicesBody> createState() => _SupplierInvoicesBodyState();
}

class _SupplierInvoicesBodyState extends State<SupplierInvoicesBody> {
  bool showAllDataInvoices = false;
  bool showAllDataSuppliers = false;
  TextEditingController invoiceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SupplierInvoiceCubit(),
      child: BlocConsumer<SupplierInvoiceCubit, SupplierInvoiceState>(
        listener: (context, state) {},
        builder: (context, state) {
          SupplierInvoiceCubit cubit = SupplierInvoiceCubit.get(context);
          return SingleChildScrollView(
            child: Column(
              children: [
                TopInvoicesSearch(
                  controller: invoiceController,
                  onPressedSearch: () {
                    cubit.searchMerchantInv(invoiceController.text);
                  },
                ),
                showDetailsText(
                    context: context,
                    onPressed: () {
                      setState(() {
                        showAllDataInvoices = !showAllDataInvoices;
                      });
                    },
                    showAll: false),
                InvoicesSuppliersTable(
                  showAllDataInvoices: showAllDataInvoices,
                ),
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
