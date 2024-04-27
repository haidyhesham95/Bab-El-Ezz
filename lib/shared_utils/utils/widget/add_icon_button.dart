import 'package:flutter/material.dart';

IconButton addIconButton( void Function()? onPressed) {
  return IconButton(
      icon: const Icon(Icons.add,size: 20,),
      color: Colors.white,
      onPressed: onPressed);
}