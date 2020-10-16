import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/devfast2020/shared/stacked_page_with_title.dart';
import 'package:flutter_presentations/features/devfast2020/shared/stacked_page_with_title_and_list.dart';
import 'package:flutter_presentations/shared/stacked_page.dart';
import 'package:presentation/presentation.dart';
import 'package:vector_math/vector_math_64.dart' as vmath;


class BuiltInExplicitAnimationExample extends StatefulWidget {
  BuiltInExplicitAnimationExample({Key key}) : super(key: key);

  _BuiltInExplicitAnimationExampleState createState() =>
      _BuiltInExplicitAnimationExampleState();
}

class _BuiltInExplicitAnimationExampleState extends State<BuiltInExplicitAnimationExample>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  var _counter = 0;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this
    )..repeat();
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      alignment: Alignment.center,
      child: Container(
        color: Colors.lightBlue
      ),
    );
  }
}

