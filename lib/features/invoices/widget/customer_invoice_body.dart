import 'package:bab_el_ezz/features/invoices/widget/list_item_customer.dart';
import 'package:bab_el_ezz/features/invoices/widget/sliver_box_list_customer.dart';
import 'package:bab_el_ezz/features/invoices/widget/sliver_box_list_invoice.dart';
import 'package:bab_el_ezz/features/invoices/widget/custom_sliver_list.dart';
import 'package:bab_el_ezz/features/invoices/widget/sliver_list_invoice.dart';
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
              cubit.add(ListItemCustomer(
                onPressed: (){},
              ));
              },
            ),
             CustomSliverList(
              items: cubit.items
            ),
          ],
        );
        },
        ),
    );
  }
}
