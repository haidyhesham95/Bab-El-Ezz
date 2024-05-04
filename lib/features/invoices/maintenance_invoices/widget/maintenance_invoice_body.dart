import 'package:bab_el_ezz/features/invoices/maintenance_invoices/widget/maintenance_customer_table.dart';
import 'package:bab_el_ezz/features/invoices/maintenance_invoices/widget/maintenance_invoices_table.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/show_details_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../invoices/widget/top_invoice_search.dart';
import '../manager/maintenance_invoice/maintenance_invoice_cubit.dart';

class MaintenanceInvoicesBody extends StatelessWidget {
  const MaintenanceInvoicesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        child: BlocProvider(
        create: (context) => MaintenanceInvoiceCubit(),
    child: BlocConsumer<MaintenanceInvoiceCubit, MaintenanceInvoiceState>(
    listener: (context, state) {},
    builder: (context, state) {
    MaintenanceInvoiceCubit cubit = MaintenanceInvoiceCubit.get(context);
    return Column(
              children: [

                TopInvoicesSearch(
                  onPressedSearch: (){},
                ),
              showDetailsText(context: context, onPressed: (){  cubit.changeShowAllDataInvoices();}),
                 MaintenanceInvoiceTable(
                  showAllDataInvoices: cubit.showAllDataInvoices,
                ),



                TopInvoicesSearch(
                  onPressedSearch: (){},
                  hintText: ' بحث عن عميل ',
                  text: ' قائمة العملاء',
                  height: 70,
                ),
                showDetailsText(context: context, onPressed: (){
                  cubit.changeShowAllDataCustomers();
                }),


                MaintenanceCustomerTable(
                  showAllDataCustomers:cubit. showAllDataCustomers,
                ),
                const SizedBox(height: 30,),

              ],


          );
        }
      )
    )
    );

  }
}
