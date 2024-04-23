import 'package:bab_el_ezz/features/invoices/widget/top_supplier_table.dart';
import 'package:flutter/material.dart';
import '../../../shared_utils/utils/widget/container_search.dart';
import '../../workshop/widget/clip_path_gradient.dart';

SliverToBoxAdapter sliverBoxListSupplier(BuildContext context, {required void Function()? onPressedSearch ,required void Function()? onPressed}) {

  return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 70,),
          clipBathGradient(context,text:" قائمة الموردين/ التجار"),
          const SizedBox(height: 30),
          ContainerSearch(
            hintText:' بحث عن مورد/تاجر ',
            onPressed: onPressedSearch,
          ) ,
          const SizedBox(height: 20),
          topSupplierTable(context,onPressed),
          const SizedBox(height: 1,),
        ],
      )
  );

}