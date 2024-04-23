import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../../styles/text.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key,  this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  SizedBox(
      height: 30,
      width:
      size.width * 0.14,
      child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: ColorsAsset.kGreen,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          onPressed: onPressed,
          child: Center(
            child: Text(
              "بحث",
              style: AppStyles.styleBold13(context),
            ),
          )),
    );
  }
}
