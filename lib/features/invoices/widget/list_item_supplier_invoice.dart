import 'package:flutter/material.dart';

import '../../../shared_utils/utils/widget/point_container.dart';
import '../../../shared_utils/utils/widget/white_container.dart';
class ListItemSupplierInvoice extends StatelessWidget {
  const ListItemSupplierInvoice({super.key, this.onPressed});

  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          PointContainer(onPressed: onPressed),
          const SizedBox(width: 1,),
          const WhiteContainer(text: ''),
          const SizedBox(width: 1,),
          const WhiteContainer(text: '',),
          const SizedBox(width: 1,),
          const WhiteContainer(text: ''),
          const SizedBox(width: 1,),
          const WhiteContainer(text: ''),
          const SizedBox(width: 1,),
          const WhiteContainer(text: ''),
          const SizedBox(width: 1,),
          const WhiteContainer(text: '',),
          const SizedBox(width: 1,),
          const WhiteContainer(text: ''),
          const SizedBox(width: 1,),
          const WhiteContainer(text: ''),
          const SizedBox(width: 1,),
          const WhiteContainer(text: ''),
        ],
      ),
    );
  }
}