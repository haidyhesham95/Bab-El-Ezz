import 'package:flutter/material.dart';

import '../../../../shared_utils/utils/widget/clip_path_gradient.dart';

class TopInvoicesSearch extends StatelessWidget {
  const TopInvoicesSearch(
      {super.key,
      required this.onPressedSearch,
      this.height,
      this.hintText,
      this.text});
  final void Function()? onPressedSearch;
  final double? height;
  final String? hintText;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: height ?? 20,
      ),
      clipBathGradient(context, text: text ?? " قائمة الفواتير"),
      const SizedBox(height: 30),
      // ContainerSearch(
      //   hintText:hintText?? ' البحث عن فاتورة ',
      //   onPressed: onPressedSearch,
      // ),
      const SizedBox(height: 20),
    ]);
  }
}
