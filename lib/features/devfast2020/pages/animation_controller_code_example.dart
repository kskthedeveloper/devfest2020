import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/coding/coding.dart';
import 'package:presentation/presentation.dart';

class AnimationControllerCodeExample extends StatefulWidget {
  const AnimationControllerCodeExample({Key key}) : super(key: key);
  @override
  _AnimationControllerCodeExampleState createState() => _AnimationControllerCodeExampleState();
}

class _AnimationControllerCodeExampleState extends State<AnimationControllerCodeExample> {
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

class AnimationControllerExample extends StatefulWidget {
  AnimationControllerExample({Key key}) : super(key: key);

  _AnimationControllerExampleState createState() =>
      _AnimationControllerExampleState();
}

class _AnimationControllerExampleState extends State<AnimationControllerExample>
    with SingleTickerProviderStateMixin {0} {
  AnimationController _sizeController;  {0}

  double _size = 0;  {0}

  @override
  void initState() {
    _sizeController =
        AnimationController(vsync: this  {0}, duration: Duration(seconds: 3));  {0}

    _sizeController.addListener(() {  {0}
      _setWidth(_sizeController.value * 300);  {0}
    });

    super.initState();
  }

  void _setWidth(val) {  {0}
    setState(() {  {0}
      _size = val;
    });
  }

  @override
  void dispose() {  {0}
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
                  width: _size,  {0}
                  height: _size,  {0}
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
  AnimationController _sizeController;  {0}
    
  @override
  void initState() {
    _sizeController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));  {0}

    _sizeController.addListener(() {
      _setWidth(_sizeController.value * 300);  {0}
    });

    super.initState();
  }
  
  RaisedButton(
      child: Text('Forward'),
      onPressed: () {
          _sizeController.forward();  {0}
      },
  ),
  
''';
