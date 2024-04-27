import 'package:flutter/cupertino.dart';

import '../../../shared_utils/utils/widget/button_widget.dart';

class SpareReceiptButtons extends StatelessWidget {
  const SpareReceiptButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return             Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ButtonWidget(
            hasElevation: true,
            text: 'طباعة فاتورة',
            onPressed: () {},
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ButtonWidget(
            hasElevation: true,
            text: 'حفظ مؤقت',
            onPressed: () {},
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ButtonWidget(
            hasElevation: true,
            text: 'انهاء الفاتورة',
            onPressed: () {},
          ),
        ),
      ],
    );

  }
}
