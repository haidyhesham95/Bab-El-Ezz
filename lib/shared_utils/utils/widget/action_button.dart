import 'package:flutter/material.dart';

IconButton actionButton(context, void Function()? onPressed) {
  return IconButton(
    onPressed: onPressed,
    icon: const Icon(
      Icons.done,
      size: 20,
      color: Colors.white,
    ),
  );
}
