import 'package:bab_el_ezz/features/invoices/widget/top_supplier_invoice_table.dart';
import 'package:flutter/material.dart';
import '../../../shared_utils/utils/widget/container_search.dart';
import '../../workshop/widget/clip_path_gradient.dart';

SliverToBoxAdapter sliverBoxListSupplierInvoice(BuildContext context, {required void Function()? onPressedSearch ,required void Function()? onPressed}) {

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
          topSupplierInvoiceTable(context,onPressed),
          const SizedBox(height: 1,),
        ],
      )
  );

}