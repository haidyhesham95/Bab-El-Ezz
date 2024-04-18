import 'package:flutter/cupertino.dart';

import '../../../generated/assets.dart';
import '../../../shared_utils/styles/text.dart';

class TopPage extends StatelessWidget {
  const TopPage({super.key, required this.text, this.widthFactor});
final String text;
final double? widthFactor;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Assets.imagesLogo,
        ),
        Align(
          widthFactor:widthFactor?? 3.2,
          alignment: Alignment.centerRight,
          child: Text(
            text,
            style: AppStyles.styleExtraBold20(context),
          ),
        ),
      ],
    );
  }
}
