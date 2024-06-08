import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> showImagePicker(BuildContext context) async {
  return showDialog<File>(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: const Text('Select Image Source'),
        children: <Widget>[
          SimpleDialogOption(
            onPressed: () async {
              await ImagePicker()
                  .pickImage(source: ImageSource.gallery)
                  .then((value) => Navigator.pop(context, File(value!.path)));
            },
            child: const Text('Gallery'),
          ),
          SimpleDialogOption(
            onPressed: () async {
              ImagePicker().pickImage(source: ImageSource.camera);
            },
            child: const Text('Camera'),
          ),
        ],
      );
    },
  );
}
