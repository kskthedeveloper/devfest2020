import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/coding/coding.dart';
import 'package:presentation/presentation.dart';

class CustomPainterExampleCode extends StatefulWidget {
  const CustomPainterExampleCode({Key key}) : super(key: key);
  @override
  _CustomPainterExampleCodeState createState() => _CustomPainterExampleCodeState();
}

class _CustomPainterExampleCodeState extends State<CustomPainterExampleCode> {
  Brightness _brightness = Brightness.dark;
  String text = complex;
  double _opacity = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // _brightness = _brightness == Brightness.dark
          //     ? Brightness.light
          //     : Brightness.dark;
          text = text == complex ? reduce : complex;

          _opacity = 0.9;

          Timer(new Duration(milliseconds: 500), () {
            setState(() {
              _opacity = 1;
            });
          });

        });
      },
      child: AnimatedOpacity(
        opacity: _opacity,
        duration: Duration(milliseconds: 300),
        child: Center(
          child: Editor(
            text,
            brightness: _brightness,
            padding: const EdgeInsets.only(left: 300, top: 200),
            fontSize: 30,
            children: const [
              AnimatedColor(
                begin: Colors.red,
                end: Colors.yellowAccent,
                child: SizedBox(
                  height: 20,
                  width: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const complex = '''
class MyArrowPainter extends CustomPainter {
  MyArrowPainter(this.head); {0}

  Offset head;

  @override
  void paint(Canvas canvas, Size size) { {0}
    Path path;

    // The arrows usually looks better with rounded caps.
    Paint paint = Paint() {0}
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = 5.0;

    path = Path(); {0}
    path.moveTo(size.width * 0.25, size.height * 0.10);
    path.relativeCubicTo(0, 0, size.width * 0.25, 50,  head.dx, head.dy);
    path = ArrowPath.make(path: path);
    canvas.drawPath(path, paint..color = Colors.blue);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true; {0}

}
''';

const reduce = '''
  CustomPaint (
      painter: MyArrowPainter(widget.head),
  ),
''';
