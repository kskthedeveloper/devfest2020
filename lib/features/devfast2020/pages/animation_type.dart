import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/devfast2020/shared/stacked_page_with_title.dart';
import 'package:flutter_presentations/shared/stacked_page.dart';
import 'package:presentation/presentation.dart';
import 'package:arrow_path/arrow_path.dart';

// TODO:: need to check the detection of the ending
class AnimationType extends StatelessWidget {
  const AnimationType(
    this.controller, {
    Key key,
  }) : super(key: key);
  final PresentationController controller;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: Theme.of(context).textTheme.headline5,
      child: ForAnimationType(
        controller: controller,
        spacing: 140,
        children: [
          Text('Animation Type'),
          Container(
            padding: const EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            child: Center(
              child: Text(
                'Implicit Animation',
                style: TextStyle(fontSize: 50.0),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            child: Center(
              child: Text(
                'Explicit Animation',
                style: TextStyle(fontSize: 50.0),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            child: Center(
              child: Text(
                'Build In',
                style: TextStyle(fontSize: 50.0),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            child: Center(
              child: Text(
                'Tween Animation Builder',
                style: TextStyle(fontSize: 50.0),
              ),
            ),
          ),
          Container(
            child: CustomPaint(
              painter: ArrowPainter(
                  startPoint: Offset(145, 125),
                  head: Offset(-250, 245),
                  side: -150
              ),
            ),
          ),
          Container(
            child: CustomPaint(
              painter: ArrowPainter(
                  startPoint: Offset(145, 125),
                  head: Offset(250, 245),
                  side: 200
              ),
            ),
          ),
          Container(
            child: CustomPaint(
              painter: ArrowPainter(
                  startPoint: Offset(120, 5),
                  head: Offset(-250, 128),
                  side: -150
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            child: Center(
              child: Text(
                'Custom Explicit Animation',
                style: TextStyle(fontSize: 50.0),
              ),
            ),
          ),
          Container(
            child: CustomPaint(
              painter: ArrowPainter(
                  startPoint: Offset(120, 5),
                  head: Offset(150, 425),
                  side: 150
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            child: Center(
              child: Text(
                'CustomPainter',
                style: TextStyle(fontSize: 50.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ForAnimationType extends StatefulWidget {
  const ForAnimationType({
    Key key,
    @required this.controller,
    @required this.children,
    @required this.spacing,
  }) : super(key: key);
  final PresentationController controller;
  final List<Widget> children;
  final double spacing;

  @override
  _ForAnimationTypeState createState() => _ForAnimationTypeState();
}

class _ForAnimationTypeState extends State<ForAnimationType>
    with SingleTickerProviderStateMixin {
  PageStepper<int> _stateController;
  AnimationController _controller;
  int _visibleChildren = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _stateController = PageStepper<int>(
      controller: widget.controller,
      steps: List.generate(widget.children.length + 2, (index) => index),
    );
    for (int step = 0; step < widget.children.length; step++) {
      _stateController.add(
        fromStep: step,
        toStep: step + 1,
        forward: () => setState(() => _visibleChildren++),
        reverse: () => setState(() => _visibleChildren--),
      );
    }
    _stateController
      ..add(
        fromStep: widget.children.length,
        toStep: widget.children.length + 1,
        forward: widget.controller.nextSlide,
      )
      ..build();
  }

  @override
  void dispose() {
    _controller.dispose();
    _stateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: Theme.of(context).textTheme.headline5,
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            top: _visibleChildren != 0 ? 100.0 : 450.0,
            left: _visibleChildren != 0 ? 10.0 : 400.0,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              // opacity: _visibleChildren > index ? 1 : 0,
              opacity: 1,
              child: widget.children[0],
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            top: _visibleChildren > 1 ? 300.0 : 350.0,
            left: _visibleChildren > 1 ? 200.0 : 220.0,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: _visibleChildren > 0 ? 1 : 0,
              child: widget.children[1],
            ),
          ),
          AnimatedPositioned(
            // Explicit Animation
            duration: const Duration(milliseconds: 300),
            top: _visibleChildren > 4 ? 250.0 : 350.0,
            right: _visibleChildren > 4 ? 50.0 : 200.0,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: _visibleChildren > 0 ? 1 : 0,
              child: widget.children[2],
            ),
          ),
          AnimatedPositioned(
            // Build In
            duration: const Duration(milliseconds: 300),
            top: 670.0,
            left: 10.0,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: _visibleChildren > 2 ? 1 : 0,
              child: widget.children[3],
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            top: 670.0,
            left: 300.0,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: _visibleChildren > 3 ? 1 : 0,
              child: widget.children[4],
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            top: 300.0,
            left: 300.0,
            height: 300.0,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: _visibleChildren > 2 ? 1 : 0,
              child: widget.children[5],
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            top: 300.0,
            left: 300.0,
            height: 300.0,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: _visibleChildren > 3 ? 1 : 0,
              child: widget.children[6],
            ),
          ),
          AnimatedPositioned(
            // Build In
            duration: const Duration(milliseconds: 300),
            top: 500.0,
            right: 500.0,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: _visibleChildren > 5 ? 1 : 0,
              child: widget.children[3],
            ),
          ),
          AnimatedPositioned(
            // Build In Arrow
            duration: const Duration(milliseconds: 300),
            top: 367.0,
            right: 500.0,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: _visibleChildren > 5 ? 1 : 0,
              child: widget.children[7],
            ),
          ),
          AnimatedPositioned(
            // Custom Explicit Animation
            duration: const Duration(milliseconds: 300),
            top: 800.0,
            right: 50.0,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: _visibleChildren > 6 ? 1 : 0,
              child: widget.children[8],
            ),
          ),
          AnimatedPositioned(
            // Build In Arrow
            duration: const Duration(milliseconds: 300),
            top: 367.0,
            right: 500.0,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: _visibleChildren > 6 ? 1 : 0,
              child: widget.children[9],
            ),
          ),
          AnimatedPositioned(
            // Custom Explicit Animation
            duration: const Duration(milliseconds: 300),
            top: 100.0,
            right: 50.0,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: _visibleChildren > 7 ? 1 : 0,
              child: widget.children[10],
            ),
          ),
        ],
      ),
    );
  }
}

extension IterableEx<T> on Iterable<T> {
  Iterable<R> mapIndexed<R>(R Function(int index, T item) mapper) sync* {
    int i = 0;
    for (final value in this) {
      yield mapper(i++, value);
    }
  }
}

class ArrowPainter extends CustomPainter {
  final Offset startPoint;
  final Offset head;
  final double side;

  ArrowPainter({this.startPoint, this.head, this.side});

  @override
  void paint(Canvas canvas, Size size) {
    Path path;

    Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = 3.0;

    /// Draw a single arrow.
    path = Path();
    path.moveTo(this.startPoint.dx, this.startPoint.dy);
    path.relativeCubicTo(0, 0, side, 10, head.dx, head.dy);
    path = ArrowPath.make(path: path);
    canvas.drawPath(path, paint..color = Colors.blue);
  }

  @override
  bool shouldRepaint(ArrowPainter oldDelegate) => true;
}
