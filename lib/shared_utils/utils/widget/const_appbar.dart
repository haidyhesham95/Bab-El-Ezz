import 'package:flutter/material.dart';

import '../../styles/text.dart';

AppBar constAppBar(BuildContext context, String title) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      style: AppStyles.styleExtraBold15(context),
    ),
    leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  );
}
