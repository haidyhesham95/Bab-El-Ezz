import 'package:flutter/material.dart';

import '../../../shared_utils/styles/colors.dart';
import '../../../shared_utils/styles/text.dart';

  ClipPath clipBathGradient(BuildContext context, {required String text,}) {

    final size = MediaQuery.of(context).size;
  return ClipPath(
    clipper: CustomClipPath(),
    child: Container(
      width: size.width * 0.65,
      height: 33,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [
            ColorsAsset.kGreen,
           const Color(0xff8CDBBB).withOpacity(0.6),
            Colors.grey.shade800,
            Colors.black,

          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            text,
            style: AppStyles.styleBold15(context).copyWith(color: Colors.white),
          ),
        ),
      ),
    ),
  );


}
  class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
  double w = size.width;
  double h = size.height;
  Path path = Path();
  path.moveTo(0,  100);
  path.lineTo(w * 0.4, 0);
  path.lineTo(w, 0);
  path.lineTo(w, h);
  path.lineTo(0, h);
  path.close();
  return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
  return false;
  }
  }