import 'package:bab_el_ezz/shared_utils/utils/widget/search_button.dart';
import 'package:flutter/material.dart';

import 'search_text_field.dart';

class ContainerSearch extends StatelessWidget {
  const ContainerSearch({
    super.key,
    required this.hintText,
    required this.onPressed,
    this.width,
    this.radius = 40,
    required this.controller,
  });
  final String? hintText;
  final void Function()? onPressed;
  final double? width;
  final double radius;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: 40,
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      margin: EdgeInsets.symmetric(horizontal: radius),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Row(
        children: [
          Expanded(
              child: SearchTextField(
            controller: controller,
            hintText: hintText,
          )),
          SearchButton(
            onPressed: onPressed,
          )
        ],
      ),
    );
  }
}
