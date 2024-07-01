import 'dart:io';

import 'package:bab_el_ezz/firebase/user_services.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../../../shared_utils/styles/colors.dart';

Container addImage(context, Function() onTap, String? image,
    {bool update = false}) {
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
          : (update ? Image.network(image) : Image.file(File(image))),
    ),
  );
}

Future<String> uploadImage(File? file, String invoiceId) async {
  if (file == null) return Future.error("File is null");
  final storageRef = FirebaseStorage.instance
      .ref()
      .child("images")
      .child(UserServices.getUserId()!)
      .child("$invoiceId.jpg");
  final snapshot = await storageRef.putFile(file).onError((error, stackTrace) {
    print("error: $error");
    return Future.error("error");
  });
  return await snapshot.ref.getDownloadURL();
}
