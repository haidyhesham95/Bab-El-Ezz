import 'package:bab_el_ezz/features/invoices/manager/supplier_invoice/supplier_invoice_cubit.dart';
import 'package:bab_el_ezz/features/invoices/widget/invoice_table.dart';
import 'package:bab_el_ezz/features/invoices/widget/supplier_table.dart';
import 'package:bab_el_ezz/features/invoices/widget/supplier_table_item.dart';
import 'package:bab_el_ezz/features/invoices/widget/top_invoice_search.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


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
                InvoiceTable(
                    onPressed: (){

                          Navigator.pushNamed(context, 'addInvoice');

                    }
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
