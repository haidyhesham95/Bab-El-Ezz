import 'package:bab_el_ezz/features/invoices/supplier_invoices/widget/invoice_supplier_table.dart';
import 'package:bab_el_ezz/features/invoices/supplier_invoices/widget/supplier_table.dart';
import 'package:bab_el_ezz/features/invoices/supplier_invoices/widget/supplier_table_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../invoices/widget/top_invoice_search.dart';
import '../manager/supplier_invoice/supplier_invoice_cubit.dart';


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
          return SingleChildScrollView(
            child: Column(
              children: [
                TopInvoicesSearch(
                  onPressedSearch: (){},
                ),
                InvoicesSuppliersTable(

                ),
                TopInvoicesSearch(
                  onPressedSearch: (){},
                  height: 70,
                  text: " قائمة الموردين/ التجار",
                  hintText: ' بحث عن مورد/تاجر ',
                ),
                SupplierTable(
                    rows: cubit.suppliersItems,
                    onPressed: (){
                      cubit.addSupplierItem(
                          supplierTableItem(context, () {}));
                    }
                )

              ],
            ),
          );
        },
      ),
    );
  }
}
