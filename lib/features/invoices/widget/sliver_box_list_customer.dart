import 'package:bab_el_ezz/features/invoices/widget/top_customer_table.dart';
import 'package:flutter/material.dart';
import '../../../shared_utils/utils/widget/container_search.dart';
import '../../workshop/widget/clip_path_gradient.dart';

SliverToBoxAdapter sliverBoxListCustomer(BuildContext context, {required void Function()? onPressedSearch ,required void Function()? onPressed}) {

    return SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             SizedBox(height: 70,),
            clipBathGradient(context,text:" قائمة العملاء"),
            const SizedBox(height: 30),
            ContainerSearch(
              hintText:' بحث عن عميل ',
              onPressed: onPressedSearch,
            ) ,
            const SizedBox(height: 20),
             topCustomerTable(context,onPressed),
            const SizedBox(height: 1,),
          ],
        )
    );

  }

