import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/coding/coding.dart';
import 'package:presentation/presentation.dart';

class AnimationControllerCodeExampleWithTweenToAnimationAndCurveToAnimatedBuilderToAnimatedWidget2 extends StatefulWidget {
  const AnimationControllerCodeExampleWithTweenToAnimationAndCurveToAnimatedBuilderToAnimatedWidget2({Key key}) : super(key: key);
  @override
  _AnimationControllerCodeExampleWithTweenToAnimationAndCurveToAnimatedBuilderToAnimatedWidget2State createState() => _AnimationControllerCodeExampleWithTweenToAnimationAndCurveToAnimatedBuilderToAnimatedWidget2State();
}

class _AnimationControllerCodeExampleWithTweenToAnimationAndCurveToAnimatedBuilderToAnimatedWidget2State extends State<AnimationControllerCodeExampleWithTweenToAnimationAndCurveToAnimatedBuilderToAnimatedWidget2> {
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
class CustomTransition extends StatelessWidget {0} {
  const CustomTransition({
    Key key,
    @required Animation<double> sizeAnimation,
  }) :  _sizeAnimation = sizeAnimation, super(key: key);

  final Animation<double> _sizeAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder( {0}{0}
      animation: _sizeAnimation,
      builder: (context, snapshot) { {0}{0}
        return Container(
          width: _sizeAnimation.value,
          height: _sizeAnimation.value,
          color: Colors.lightBlue,
        );
      }
    );
  }
}
''';

const reduce = '''
class CustomTransition extends AnimatedWidget {0} {
  const CustomTransition({
    Key key,
    @required Animation<double> sizeAnimation,
  }) :  _sizeAnimation = sizeAnimation, super(key: key, listenable: sizeAnimation {0});

  final Animation<double> _sizeAnimation;

  @override
  Widget build(BuildContext context) {
   Animation<double> animation = listenable;{0}
  
        return Container(
          width: animation.value,{0}
          height: animation.value,{0}
          color: Colors.lightBlue,
        );
        
  }
}
''';
