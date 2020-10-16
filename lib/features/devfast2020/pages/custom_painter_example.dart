import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/devfast2020/shared/stacked_page_with_title.dart';
import 'package:flutter_presentations/features/devfast2020/shared/stacked_page_with_title_and_list.dart';
import 'package:flutter_presentations/shared/stacked_page.dart';
import 'package:presentation/presentation.dart';
import 'package:vector_math/vector_math_64.dart' as vmath;
import 'package:arrow_path/arrow_path.dart';


class CustomPainterExample extends StatefulWidget {
  Offset head = Offset(100, 100);
  CustomPainterExample({Key key}) : super(key: key);

  _CustomPainterExampleState createState() =>
      _CustomPainterExampleState();
}

class _CustomPainterExampleState extends State<CustomPainterExample>
    with SingleTickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          widget.head += details.delta;
        });
      },
      child: CustomPaint (
        painter: MyArrowPainter(widget.head),
      ),
    );
  }
}

class MyArrowPainter extends CustomPainter {
  MyArrowPainter(this.head);

  Offset head;

  @override
  void paint(Canvas canvas, Size size) {
    Path path;

    // The arrows usually looks better with rounded caps.
    Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = 5.0;

    path = Path();
    path.moveTo(size.width * 0.25, size.height * 0.10);
    path.relativeCubicTo(0, 0, size.width * 0.25, 50,  head.dx, head.dy);
    path = ArrowPath.make(path: path);
    canvas.drawPath(path, paint..color = Colors.blue);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}