import 'package:bab_el_ezz/features/workshop/widget/work_shop_body.dart';
import 'package:flutter/material.dart';

import '../../../shared_utils/utils/widget/appbar_widget.dart';

class WorkShopPage extends StatelessWidget {
  const WorkShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context),
      body:const WorkShopBody(),

    );
  }
}
