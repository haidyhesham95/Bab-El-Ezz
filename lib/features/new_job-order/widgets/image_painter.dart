import 'dart:ui';

import 'package:flutter/material.dart';

class ImagePainter extends CustomPainter {
  final List<List<Offset>> lines;
  final Paint drawPaint;
  final Paint markPaint;

  ImagePainter({required this.lines, required this.drawPaint, required this.markPaint});

  @override
  void paint(Canvas canvas, Size size) {
    for (final line in lines) {
      if (line.isNotEmpty) {
        if (line.length == 1) {
          canvas.drawPoints(PointMode.points, line, markPaint);
        } else {
          canvas.drawPoints(PointMode.polygon, line, drawPaint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}