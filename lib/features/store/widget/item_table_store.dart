import 'package:flutter/material.dart';

import '../../../shared_utils/utils/widget/white_container.dart';

class ItemTableStore extends StatelessWidget {
  const ItemTableStore({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        WhiteContainer(text: 'ggdddddddddd'),
        WhiteContainer(text: 'gg', flex: 4),
        WhiteContainer(text: 'raearefd', flex: 4),
        WhiteContainer(text: 'mjhjg'),
        WhiteContainer(text: 'jyhj'),
        WhiteContainer(text: 'ghgh', flex: 4),
        WhiteContainer(text: 'ghgj', flex: 3),
        WhiteContainer(text: 'hjgjg'),
      ],
    );
  }
}
