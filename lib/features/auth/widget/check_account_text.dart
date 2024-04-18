import 'package:flutter/material.dart';
import '../../../shared_utils/styles/text.dart';

class CheckAccountText extends StatelessWidget {
  const CheckAccountText({super.key, required this.text1, required this.text2,required this.onPressed});
final String text1;
final String text2;
final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: AppStyles.styleRegular16(context),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            text2,
            style: AppStyles.styleBold16(context)
                .copyWith(color: Colors.white),
          ),
        ),
      ],
    );

  }
}
