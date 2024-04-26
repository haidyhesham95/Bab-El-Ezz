import 'package:flutter/material.dart';

import '../../../shared_utils/styles/text.dart';
import '../../../shared_utils/utils/widget/text_field.dart';

TextFieldWidget addNoteText(BuildContext context) {
  final size = MediaQuery.of(context).size;
  return TextFieldWidget(
    height: size.height * 0.09,
    label: " اضافة ملاحظات ",
    titleStyle: AppStyles.styleMedium18(context),
    hintStyle: AppStyles.styleSemiBold14(context),
    hintText: "ملاحظات..",
    maxLines: 3,
    textInputAction: TextInputAction.next,
    keyboardType: TextInputType.text,
  );
}

