import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/devfast2020/shared/stacked_page_with_title.dart';
import 'package:flutter_presentations/features/devfast2020/shared/stacked_page_with_title_and_list.dart';
import 'package:flutter_presentations/shared/stacked_page.dart';
import 'package:presentation/presentation.dart';
import 'package:vector_math/vector_math_64.dart' as vmath;

class ExplicitAnimation extends StatefulWidget {
  const ExplicitAnimation(
      this.controller, {
        Key key,
      }) : super(key: key);
  final PresentationController controller;

  @override
  _ExplicitAnimationState createState() => _ExplicitAnimationState();
}

class _ExplicitAnimationState extends State<ExplicitAnimation> {
  double _opacity = 0.0;
  var _color = Colors.lightBlue;

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
                Text('Explicit Animation'),
                Text(
                  'What do we need to know?',
                  style: TextStyle(fontSize: 50),
                ),
                Text(
                  'Animation',
                  style: TextStyle(fontSize: 50),
                ),
                Text(
                  'AnimationController',
                  style: TextStyle(fontSize: 50),
                ),
                Text(
                  'Tweens',
                  style: TextStyle(fontSize: 50),
                ),

                Text(
                  'AnimatedBuilder',
                  style: TextStyle(fontSize: 50),
                ),
                Text(
                  'AnimatedWidget',
                  style: TextStyle(fontSize: 50),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
