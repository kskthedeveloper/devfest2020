import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/devfast2020/shared/stacked_page_with_title.dart';
import 'package:flutter_presentations/features/devfast2020/shared/stacked_page_with_title_and_list.dart';
import 'package:flutter_presentations/shared/stacked_page.dart';
import 'package:presentation/presentation.dart';
import 'package:vector_math/vector_math_64.dart' as vmath;


class AnimationControllerRefactoredToAnimationBuilderExample extends StatefulWidget {
  AnimationControllerRefactoredToAnimationBuilderExample({Key key}) : super(key: key);

  _AnimationControllerRefactoredToAnimationBuilderExampleState createState() =>
      _AnimationControllerRefactoredToAnimationBuilderExampleState();
}

class _AnimationControllerRefactoredToAnimationBuilderExampleState extends State<AnimationControllerRefactoredToAnimationBuilderExample>
    with SingleTickerProviderStateMixin {
  AnimationController _sizeController;
  var _counter = 0;

  Tween<double> _sizeTween = Tween<double>(begin: 0, end: 300);
  Animation<double> _sizeAnimation;
  Animation<double> _curvedAnimation;

  @override
  void initState() {
    _sizeController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    super.initState();

    _curvedAnimation = CurvedAnimation(
        parent: _sizeController,
        curve: Curves.bounceOut,
        reverseCurve: Curves.bounceIn
    );

    _sizeAnimation = _sizeTween.animate(_curvedAnimation);
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
                  AnimatedBuilder(
                    animation: _sizeAnimation,
                    builder: (context, snapshot) {
                      return Container(
                        width: _sizeAnimation.value,
                        height: _sizeAnimation.value,
                        color: Colors.lightBlue,
                      );
                    }
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
