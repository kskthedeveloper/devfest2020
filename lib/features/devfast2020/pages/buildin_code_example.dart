import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/coding/coding.dart';
import 'package:presentation/presentation.dart';

class BuiltInCodeExample extends StatefulWidget {
  const BuiltInCodeExample({Key key}) : super(key: key);
  @override
  _BuiltInCodeExampleState createState() => _BuiltInCodeExampleState();
}

class _BuiltInCodeExampleState extends State<BuiltInCodeExample> {
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
class AnimatedContainerExample extends StatefulWidget {
  @override
  _AnimatedContainerState createState() => _AnimatedContainerState();
}

class _AnimatedContainerState extends State<AnimatedContainerExample> {
  var _width = 100.0; {0}
  var _height = 100.0; {0}

  @override
  Widget build(BuildContext context) {
    return GestureDetector (
      child: AnimatedContainer {0} (
        width: _width,
        height: _height,
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
        ),
      ),
      onTap: () {
        setState(() {
          _width = 200.0; {0}
          _height = 200.0; {0}
        });
      },
    );
  }
}
''';

const reduce = '''
    AnimatedContainer( {0}
      width: _width,
      height: _height,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
      ),
    );
    
     setState(() {
          _width = 200.0; {0}
          _height = 200.0; {0}
     });
''';
