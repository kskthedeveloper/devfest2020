import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/coding/coding.dart';
import 'package:presentation/presentation.dart';

class BuiltInExplicitAnimationExampleCode extends StatefulWidget {
  const BuiltInExplicitAnimationExampleCode({Key key}) : super(key: key);
  @override
  _BuiltInExplicitAnimationExampleCodeState createState() => _BuiltInExplicitAnimationExampleCodeState();
}

class _BuiltInExplicitAnimationExampleCodeState extends State<BuiltInExplicitAnimationExampleCode> {
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
class BuiltInExplicitAnimationExample extends StatefulWidget {
  BuiltInExplicitAnimationExample({Key key}) : super(key: key);

  _BuiltInExplicitAnimationExampleState createState() =>
      _BuiltInExplicitAnimationExampleState();
}

class _BuiltInExplicitAnimationExampleState extends State<BuiltInExplicitAnimationExample>
    with SingleTickerProviderStateMixin {0} {
  AnimationController _controller; {0}

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 5), {0}
      vsync: this {0}
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition( {0}
      turns: _controller, {0}
      child: Container(
        color: Colors.lightBlue
      ),
    );
  }
}

''';

const reduce = '''
  AnimationController _controller; {0}

    _controller = AnimationController(
      duration: Duration(seconds: 5), {0}
      vsync: this {0}
    )..repeat();

  @override
  Widget build(BuildContext context) {
    return RotationTransition( {0}
      turns: _controller, {0}
      child: Container(
        color: Colors.lightBlue
      ),
    );
  }
''';
