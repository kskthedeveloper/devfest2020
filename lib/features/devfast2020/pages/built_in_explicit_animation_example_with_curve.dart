import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/devfast2020/shared/stacked_page_with_title.dart';
import 'package:flutter_presentations/features/devfast2020/shared/stacked_page_with_title_and_list.dart';
import 'package:flutter_presentations/shared/stacked_page.dart';
import 'package:presentation/presentation.dart';
import 'package:vector_math/vector_math_64.dart' as vmath;


class BuiltInExplicitAnimationExampleWithCurve extends StatefulWidget {
  BuiltInExplicitAnimationExampleWithCurve({Key key}) : super(key: key);

  _BuiltInExplicitAnimationExampleWithCurveState createState() =>
      _BuiltInExplicitAnimationExampleWithCurveState();
}

class _BuiltInExplicitAnimationExampleWithCurveState extends State<BuiltInExplicitAnimationExampleWithCurve>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _rotationAnimation;
  var _counter = 0;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(seconds: 5),
        vsync: this
    );

    _rotationAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceOut
    ));

    _controller.repeat();

  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _rotationAnimation,
      alignment: Alignment.center,
      child: Container(
          color: Colors.lightBlue
      ),
    );
  }
}