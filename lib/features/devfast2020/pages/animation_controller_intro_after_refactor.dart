import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/devfast2020/shared/stacked_page_with_title.dart';
import 'package:flutter_presentations/features/devfast2020/shared/stacked_page_with_title_and_list.dart';
import 'package:flutter_presentations/shared/stacked_page.dart';
import 'package:presentation/presentation.dart';
import 'package:vector_math/vector_math_64.dart' as vmath;


class AnimationControllerRefactoredExample extends StatefulWidget {
  AnimationControllerRefactoredExample({Key key}) : super(key: key);

  _AnimationControllerRefactoredExampleState createState() =>
      _AnimationControllerRefactoredExampleState();
}

class _AnimationControllerRefactoredExampleState extends State<AnimationControllerRefactoredExample>
    with SingleTickerProviderStateMixin {
  AnimationController _sizeController;

  Tween<double> _sizeTween = Tween<double>(begin: 0, end: 300);
  Animation<double> _sizeAnimation;
  Animation<double> _curvedAnimation;
  var _counter = 0;

  @override
  void initState() {
    _sizeController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    _sizeController.addListener(() {
      setState((){
      });
    });

    super.initState();

    _curvedAnimation = CurvedAnimation(
        parent: _sizeController,
        curve: Curves.bounceOut,
        reverseCurve: Curves.bounceIn
    );

    _sizeAnimation = _sizeTween.animate(_curvedAnimation);
  }

  @override
  void dispose() {
    _sizeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      _counter++;
    });

    return
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: _sizeAnimation.value,
                    height: _sizeAnimation.value,
                    color: Colors.lightBlue,
                  )
                ],
              ),
              RaisedButton(
                child: Text('Repeat'),
                onPressed: () {
                  _sizeController.repeat(reverse: true);
                },
              ),
              RaisedButton(
                child: Text('Stop'),
                onPressed: () {
                  _sizeController.stop();
                },
              ),
              Text('built count: $_counter')
            ],
          ),
        ],
      );
  }
}
