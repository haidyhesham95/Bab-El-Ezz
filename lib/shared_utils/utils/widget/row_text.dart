import 'package:flutter/material.dart';

import '../../styles/text.dart';


class RowText extends StatelessWidget {
  const RowText(this.title, this.data,
      {super.key, this.textStyle, this.dataStyle});

  final String? title;
  final String? data;
  final TextStyle? textStyle;
  final TextStyle? dataStyle;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: title,
            style: AppStyles.styleSemiBold16(context),
          ),
          TextSpan(
            text: data,
            style: AppStyles.styleSemiBold14(context).copyWith(color: Colors.white),

          ),
        ],
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }
}

