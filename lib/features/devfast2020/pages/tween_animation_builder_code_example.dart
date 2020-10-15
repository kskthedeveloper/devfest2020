import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/coding/coding.dart';
import 'package:presentation/presentation.dart';

class TweenAnimationBuilderCodeExample extends StatefulWidget {
  const TweenAnimationBuilderCodeExample({Key key}) : super(key: key);
  @override
  _TweenAnimationBuilderCodeExampleState createState() => _TweenAnimationBuilderCodeExampleState();
}

class _TweenAnimationBuilderCodeExampleState extends State<TweenAnimationBuilderCodeExample> {
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
class TweenAnimationBuilderTest extends StatefulWidget {
  @override
  _TweenAnimationBuilderTestState createState() => _TweenAnimationBuilderTestState();
}

class _TweenAnimationBuilderTestState extends State<TweenAnimationBuilderTest> {
  double targetValue = 40; {0}
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(targetValue);
        setState(() {
          targetValue = targetValue == 10 ? 40 : 10; {0}
        });
      },
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: targetValue), {0}
        duration: Duration(milliseconds: 2000), {0}
        builder: (BuildContext context, double _val, Widget child) { {0}
          return Opacity(
            opacity: _val /targetValue > 1 ? 1 : (_val /targetValue),
            child: Padding(
              padding: EdgeInsets.only(top: _val * 20),
              child: child,
            ),
          );
        },
        child: Text('Testing'),
      ),
    );
  }
}
''';

const reduce = '''
    TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: targetValue), 
        duration: Duration(milliseconds: 2000), 
        builder: (BuildContext context, double _val, Widget child) { {0}
          return Opacity(
            opacity: _val /targetValue > 1 ? 1 : (_val /targetValue),
            child: Padding(
              padding: EdgeInsets.only(top: _val * 20),
              child: child,
            ),
          );
        },
        child: Text('Testing'),
    ),
''';
