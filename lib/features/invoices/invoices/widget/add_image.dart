import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../shared_utils/styles/colors.dart';

Container addImage(context, Function() onTap, File? image) {
  final Size size = MediaQuery.of(context).size;
  return Container(
    width: double.infinity,
    height: size.height * 0.15,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.all(color: ColorsAsset.kGreen, width: 1.5),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 4,
            spreadRadius: 0,
            color: Colors.black.withOpacity(0.15),
          )
        ]),
    child: InkWell(
      onTap: onTap,
      child: image == null
          ? Image.asset(
              'assets/images/logo1.png',
              fit: BoxFit.fitHeight,
              color: Colors.grey,
            )
          : Image.file(image),
    ),
  );
}
