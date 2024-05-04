import 'package:flutter/material.dart';

Container toggleContainer(context, Widget? child) {
  final size = MediaQuery.of(context).size;

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    height: 50,
    width: double.infinity,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
      ),
      gradient: LinearGradient(colors: [
        Colors.black,
        Color.fromRGBO(7, 26, 18, 98),
        Color.fromRGBO(17, 62, 44, 97),
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
    ),
    child: Container(
        width: size.width * 0.35,
        height: size.height * 0.045,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color(0xff989090).withOpacity(0.3),
        ),
        child: child),
  );
}
