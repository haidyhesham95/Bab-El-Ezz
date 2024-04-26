import 'package:bab_el_ezz/features/invoices/widget/customer_table.dart';
import 'package:bab_el_ezz/features/invoices/widget/list_invoices_table.dart';
import 'package:bab_el_ezz/features/invoices/widget/top_invoice_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/customer_invoice/customer_invoice_cubit.dart';
class CustomerInvoiceBody extends StatelessWidget {
  const CustomerInvoiceBody({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerInvoiceCubit(),

      child: BlocConsumer<CustomerInvoiceCubit, CustomerInvoiceState>(
        listener: (context, state) {},
        builder: (context, state) {
          CustomerInvoiceCubit cubit = CustomerInvoiceCubit.get(context);

          return SingleChildScrollView(
            child: Column(
              children: [

                TopInvoicesSearch(
                  onPressedSearch: (){},
                ),
                const ListInvoiceTable() ,

                TopInvoicesSearch(
                  onPressedSearch: (){},
                  hintText: ' بحث عن عميل ',
                  text: ' قائمة العملاء',
                  height: 70,
                ),

                CustomerTable(
                    onPressed: () {
                     Navigator.pushNamed(context, 'addCustomer');
                    }
                ),
              ],
            )

          );
        },
        ),
    );
  }
}
