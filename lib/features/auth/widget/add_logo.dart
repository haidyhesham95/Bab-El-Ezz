import 'dart:io';

import 'package:bab_el_ezz/features/invoices/invoices/widget/add_image.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/pick_image.dart';
import 'package:flutter/material.dart';

import '../../../shared_utils/styles/text.dart';

class AddLogo extends StatelessWidget {
  AddLogo(
      {super.key, required void Function(File?) this.onTap, this.imageFile});

  File? imageFile;
  Function(File?) onTap;

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
            // child: SvgPicture.asset(
            //   Assets.imagesAddImage,
            //   fit: BoxFit.scaleDown,
            // ),
            child: addImage(context, () async {
              imageFile = await showImagePicker(context);
              onTap(imageFile);
            }, imageFile?.absolute.path),
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
