import 'package:bab_el_ezz/features/invoices/widget/top_customer_table.dart';
import 'package:bab_el_ezz/features/invoices/widget/top_invoice_table.dart';
import 'package:flutter/material.dart';
import '../../../shared_utils/utils/widget/container_search.dart';
import '../../workshop/widget/clip_path_gradient.dart';

SliverToBoxAdapter sliverBoxListInvoice(BuildContext context, {required void Function()? onPressedSearch}) {

  return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          clipBathGradient(context,text:" قائمة الفواتير"),
          const SizedBox(height: 30),
          ContainerSearch(
            hintText:' بحث عن فاتورة ',
            onPressed: onPressedSearch,
          ) ,
          const SizedBox(height: 20),
          topInvoiceTable(context),
          const SizedBox(height: 1,),
        ],
      )
  );

}
