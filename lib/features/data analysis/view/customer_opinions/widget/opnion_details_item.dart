import 'package:flutter/material.dart';

import '../../financial/widget/item.dart';
import '../../financial/widget/model_details.dart';

class OpnionItems extends StatelessWidget {
  const OpnionItems( {super.key});



  @override
  Widget build(BuildContext context) {
    List items = [
      const ItemDetailsModel(
        color: Colors.blue,
        title: 'راض',
      ),
      const ItemDetailsModel(
        color: Colors.green,
        title: 'محايد',
      ),
      const ItemDetailsModel(
        color: Colors.orange,
        title: 'غير راض',
      ),
    ];
    return SizedBox(
        height: 50,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 8
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ItemDetails(itemDetailsModel: items[index]);
          },
        )
    );
  }


}