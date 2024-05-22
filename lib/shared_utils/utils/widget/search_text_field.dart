import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../../styles/text.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key, this.hintText, required this.controller});
  final String? hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.start,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: AppStyles.styleRegular13(context).copyWith(
          color: ColorsAsset.kDarkBrown,
        ),
        cursorColor: ColorsAsset.kGreen,
        cursorHeight: 15,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
          alignLabelWithHint: true,
          fillColor: Colors.white,
          filled: true,

          //  hintTextDirection: TextDirection.rtl,
          hintText: hintText,

          hintStyle: AppStyles.styleRegular13(context).copyWith(
            color: ColorsAsset.kDarkBrown,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
