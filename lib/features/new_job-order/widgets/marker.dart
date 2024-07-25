import 'package:bab_el_ezz/shared_utils/styles/colors.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/assets.dart';
import 'image_painter.dart';

enum DrawingMode {
  Draw,
  Mark,
}

class InteractiveImagePainter extends StatefulWidget {
  InteractiveImagePainter(
      {super.key, required this.globalKey, required this.backgroundImage});

  GlobalKey globalKey;
  String? backgroundImage;

  @override
  _InteractiveImagePainterState createState() =>
      _InteractiveImagePainterState();
}

class _InteractiveImagePainterState extends State<InteractiveImagePainter> {
  List<List<Offset>> lines = [];
  DrawingMode mode = DrawingMode.Draw;
  Paint drawPaint = Paint()
    ..color = ColorsAsset.kGreen
    ..strokeWidth = 5.0
    ..strokeCap = StrokeCap.round;
  Paint markPaint = Paint()
    ..color = Colors.blue
    ..strokeWidth = 2.0
    ..style = PaintingStyle.stroke;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              setState(() {
                mode = DrawingMode.Draw;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.edit_attributes),
            onPressed: () {
              setState(() {
                mode = DrawingMode.Mark;
              });
            },
          ),
        ],
      ),
      body: RepaintBoundary(
        key: widget.globalKey,
        child: Stack(
          children: [
            widget.backgroundImage == null
                ? Image.asset(Assets.imagesCars)
                : Image.network(
                    widget.backgroundImage!,
                  ),
            GestureDetector(
              onPanDown: (details) {
                setState(() {
                  if (mode == DrawingMode.Draw) {
                    lines.add([details.localPosition]);
                  } else if (mode == DrawingMode.Mark) {
                    lines.add([]);
                  }
                });
              },
              onPanUpdate: (details) {
                setState(() {
                  if (mode == DrawingMode.Draw) {
                    lines.last.add(details.localPosition);
                  }
                });
              },
              child: CustomPaint(
                painter: ImagePainter(
                    lines: lines, drawPaint: drawPaint, markPaint: markPaint),
                child: const SizedBox.expand(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
