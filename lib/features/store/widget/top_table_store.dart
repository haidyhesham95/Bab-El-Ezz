import 'package:flutter/material.dart';
import '../../../shared_utils/utils/widget/white_container.dart';

Row topTableStore (BuildContext context) {
    return  const Row(
      children: [
        WhiteContainer(text: 'مسلسل'),
        WhiteContainer(text: 'اسم الصنف', flex: 4),
        WhiteContainer(text: 'كود الصنف', flex: 4),
        WhiteContainer(text: 'الكمية'),
        WhiteContainer(text: 'الماركة'),
        WhiteContainer(text: 'سعر الجملة', flex: 4),
        WhiteContainer(text: 'سعر البيع', flex: 3),
        WhiteContainer(text: 'تنبيه'),
      ],
    );
  }

