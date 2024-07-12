import 'package:flutter/material.dart';


import '../../../../../shared_utils/styles/text.dart';
import 'model_details.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key, required this.itemDetailsModel});

  final ItemDetailsModel itemDetailsModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child:
      ListTile(
        leading: Container(
          width: 12,
          height: 12,
          decoration: ShapeDecoration(
            color: itemDetailsModel.color,
            shape: const OvalBorder(),
          ),
        ),
        title: Text(
          itemDetailsModel.title,
          style: AppStyles.styleRegular16(context),
        ),

      ),
    );
  }
}