import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../generated/assets.dart';
import '../../../shared_utils/styles/text.dart';

class AddLogo extends StatelessWidget {
  const AddLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'إضافة شعار للمركز',
          style: AppStyles.styleBold15(context),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: size.height * 0.15,
          width: size.width * 0.5,
          child: Card(
            color: Colors.white,
            child: SvgPicture.asset(
              Assets.imagesAddImage,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Text(
          'في حالة عدم وجود شعار للمركز اتصل للمساعدة 0100000',
          style: AppStyles.styleRegular16(context),
        ),
      ],
    );
  }
}
