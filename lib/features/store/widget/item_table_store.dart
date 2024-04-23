import 'package:flutter/material.dart';

import '../../../shared_utils/utils/widget/white_container.dart';

class ItemTableStore extends StatelessWidget {
  const ItemTableStore({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        WhiteContainer(text: '444'),
        SizedBox(width: 1),

        WhiteContainer(text: 'gg', flex: 4, width: 70),
        SizedBox(width: 1),

        WhiteContainer(text: 'raearefd', flex: 4, width: 70),
        SizedBox(width: 1),

        WhiteContainer(text: 'mjhjg'),
        SizedBox(width: 1),

        WhiteContainer(text: 'jyhj'),
        SizedBox(width: 1),

        WhiteContainer(text: 'ghgh', flex: 4, width: 70),
        SizedBox(width: 1),

        WhiteContainer(text: 'ghgj', flex: 3, width: 70),
        SizedBox(width: 1),

        WhiteContainer(text: 'hjgjg'),
      ],
    );
  }
}
