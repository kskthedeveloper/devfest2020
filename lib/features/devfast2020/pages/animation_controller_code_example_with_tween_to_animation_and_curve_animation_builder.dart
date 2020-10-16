import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/coding/coding.dart';
import 'package:presentation/presentation.dart';

class AnimationControllerCodeExampleWithTweenToAnimationAndCurveToAnimatedBuilder extends StatefulWidget {
  const AnimationControllerCodeExampleWithTweenToAnimationAndCurveToAnimatedBuilder({Key key}) : super(key: key);
  @override
  _AnimationControllerCodeExampleWithTweenToAnimationAndCurveToAnimatedBuilderState createState() => _AnimationControllerCodeExampleWithTweenToAnimationAndCurveToAnimatedBuilderState();
}

class _AnimationControllerCodeExampleWithTweenToAnimationAndCurveToAnimatedBuilderState extends State<AnimationControllerCodeExampleWithTweenToAnimationAndCurveToAnimatedBuilder> {
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

  Tween<double> _sizeTween = Tween<double>(begin: 0, end: 300); 
  Animation<double> _sizeAnimation; 
  Animation<double> _curvedAnimation; {0}
  var _counter = 0; {0}{0}

  @override
  void initState() {
    _sizeController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    _sizeController.addListener(() { {0}{0}{0}
      setState((){}); 
    });

    super.initState();
    
    _curvedAnimation = CurvedAnimation(
      parent: _sizeController,
      curve: Curves.bounceIn,
      reverseCurve: Curves.bounceOut
    );
    
    _sizeAnimation = _sizeTween.animate(_curvedAnimation); {0}
  }

  @override
  Widget build(BuildContext context) {
    _counter++; {0}{0}
    
    return 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: _sizeAnimation.value, {0}
                  height: _sizeAnimation.value, {0}
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
            Text('built count: _counter') {0}
          ],
        );
    }
  }
''';

const reduce = '''
class _AnimationControllerExampleState extends State<AnimationControllerExample>
    with SingleTickerProviderStateMixin {
  AnimationController _sizeController;

  Tween<double> _sizeTween = Tween<double>(begin: 0, end: 300); 
  Animation<double> _sizeAnimation; 
  Animation<double> _curvedAnimation; {0}

  @override
  void initState() {
    _sizeController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    super.initState();
    
    _curvedAnimation = CurvedAnimation(
      parent: _sizeController,
      curve: Curves.bounceIn,
      reverseCurve: Curves.bounceOut
    );
    
    _sizeAnimation = _sizeTween.animate(_curvedAnimation); {0}
  }

  @override
  Widget build(BuildContext context) {
    return 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
              AnimatedBuilder( {0}{0}
                animation: _sizeAnimation, {0}
                builder: (context, child) { {0}
                   return Container(
                      width: _sizeAnimation.value,
                      height: _sizeAnimation.value,
                      color: Colors.lightBlue,
                   );
                }, 
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
