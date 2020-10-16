import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/devfast2020/shared/stacked_page_with_title.dart';
import 'package:flutter_presentations/features/devfast2020/shared/stacked_page_with_title_and_list.dart';
import 'package:flutter_presentations/shared/stacked_page.dart';
import 'package:presentation/presentation.dart';
import 'package:vector_math/vector_math_64.dart' as vmath;

class WhyAnimatedWidget extends StatefulWidget {
  const WhyAnimatedWidget(
      this.controller, {
        Key key,
      }) : super(key: key);
  final PresentationController controller;

  @override
  _WhyAnimatedWidgetState createState() => _WhyAnimatedWidgetState();
}

class _WhyAnimatedWidgetState extends State<WhyAnimatedWidget> {
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
                Text('AnimatedWidget'),
                Text(
                  'Why',
                  style: TextStyle(fontSize: 50),
                ),
                Text(
                  'built in explicit animation extend AnimatedWidget',
                  style: TextStyle(fontSize: 50),
                ),
                Text(
                  'FooTransition',
                  style: TextStyle(fontSize: 50),
                ),
                Text(
                  'FooTransition Vs AnimatedFoo',
                  style: TextStyle(fontSize: 50),
                ),
                Text(
                  'eg. ScaleTransition, SlideTransition, RotationTransition',
                  style: TextStyle(fontSize: 50),
                ),
                Text(
                  '...',
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
