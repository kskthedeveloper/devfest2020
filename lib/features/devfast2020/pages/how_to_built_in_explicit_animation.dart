import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/devfast2020/shared/stacked_page_with_title.dart';
import 'package:flutter_presentations/features/devfast2020/shared/stacked_page_with_title_and_list.dart';
import 'package:flutter_presentations/shared/stacked_page.dart';
import 'package:presentation/presentation.dart';
import 'package:vector_math/vector_math_64.dart' as vmath;

class HowToBuiltInExplicitAnimation extends StatefulWidget {
  const HowToBuiltInExplicitAnimation(
      this.controller, {
        Key key,
      }) : super(key: key);
  final PresentationController controller;

  @override
  _HowToBuiltInExplicitAnimationState createState() => _HowToBuiltInExplicitAnimationState();
}

class _HowToBuiltInExplicitAnimationState extends State<HowToBuiltInExplicitAnimation> {
  double _opacity = 0.0;
  var _color = Colors.lightBlue;
  double _width = 100;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: Theme.of(context).textTheme.headline5,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: StackedPageWithTitleAndList(
              controller: widget.controller,
              spacing: 30,
              children: const [
                Text('Builtin Explicit Animation'),
                Text(
                  'What do we need',
                  style: TextStyle(fontSize: 50),
                ),
                Text(
                  'controller',
                  style: TextStyle(fontSize: 50),
                ),
                Text(
                  'FooTransition',
                  style: TextStyle(fontSize: 50),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
