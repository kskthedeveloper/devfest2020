import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/coding/coding.dart';
import 'package:presentation/presentation.dart';

class AnimationControllerCodeExampleWithTween extends StatefulWidget {
  const AnimationControllerCodeExampleWithTween({Key key}) : super(key: key);
  @override
  _AnimationControllerCodeExampleWithTweenState createState() => _AnimationControllerCodeExampleWithTweenState();
}

class _AnimationControllerCodeExampleWithTweenState extends State<AnimationControllerCodeExampleWithTween> {
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
class _AnimationControllerExampleState extends State<AnimationControllerExample>
    with SingleTickerProviderStateMixin {
  AnimationController _sizeController;

  double _size = 0; {0}

  @override
  void initState() {
    _sizeController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    _sizeController.addListener(() {
      _setWidth(_sizeController.value * 300); {0}
    });

    super.initState();
  }

  void _setWidth(val) {
    setState(() {
      _size = val;
    });
  }

  @override
  void dispose() {
    _sizeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: _size, {0}
                  height: _size, {0}
                  color: Colors.lightBlue,
                )
              ],
            ),
            RaisedButton(
              child: Text('Forward'),
              onPressed: () {
                _sizeController.forward();
              },
            ),
          ],
        );
  }
}
''';

const reduce = '''
class _AnimationControllerExampleState extends State<AnimationControllerExample>
    with SingleTickerProviderStateMixin {
  AnimationController _sizeController;

  Tween<double> _sizeTween = Tween<double>(begin: 0, end: 300); {0}

  @override
  void initState() {
    _sizeController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    _sizeController.addListener(() {
      setState((){}); {0}
    });

    super.initState();
  }

  @override
  void dispose() {
    _sizeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: _sizeTween.evaluate(_sizeController), {0}
                  height: _sizeTween.evaluate(_sizeController), {0}
                  color: Colors.lightBlue,
                )
              ],
            ),
            RaisedButton(
              child: Text('Forward'),
              onPressed: () {
                _sizeController.forward();
              },
            ),
          ],
        );
  }
}
''';
