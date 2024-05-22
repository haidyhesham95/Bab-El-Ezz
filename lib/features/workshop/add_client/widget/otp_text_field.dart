import 'package:bab_el_ezz/shared_utils/utils/widget/text_field.dart';
import 'package:flutter/material.dart';

class OtpTextField extends StatelessWidget {
  const OtpTextField(
      {super.key, this.previous = true, required this.controller});
  final bool previous;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      height: 50,
      width: 50,
      textAlign: TextAlign.center,
      controller: controller,
      onSaved: (value) {},
      onChanged: (e) {
        if (e.length == 1) {
          FocusScope.of(context).nextFocus();
        }
        if (previous) {
          if (e.isEmpty) {
            FocusScope.of(context).previousFocus();
          }
        }
      },
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
    );
  }
}
