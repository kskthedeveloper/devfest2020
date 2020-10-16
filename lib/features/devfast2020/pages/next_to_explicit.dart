import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/devfast2020/pages/explicit_animation_example/pages/auth_page.dart';
import 'package:flutter_presentations/features/devfast2020/shared/stacked_page_with_title.dart';
import 'package:flutter_presentations/features/devfast2020/shared/stacked_page_with_title_and_list.dart';
import 'package:flutter_presentations/shared/stacked_page.dart';
import 'package:presentation/presentation.dart';
import 'package:vector_math/vector_math_64.dart' as vmath;

class NextToExplicitAnimation extends StatefulWidget {
  const NextToExplicitAnimation(
      this.controller, {
        Key key,
      }) : super(key: key);
  final PresentationController controller;

  @override
  _NextToExplicitAnimationState createState() => _NextToExplicitAnimationState();
}

class _NextToExplicitAnimationState extends State<NextToExplicitAnimation> {
  double _opacity = 0.0;
  var _color = Colors.lightBlue;
  double _width = 100;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: Theme.of(context).textTheme.headline5,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            child: GestureDetector(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                width: 30,
                height: 30,
                color: _color,
              ),
              onTap: () {
                setState(() {
                  _opacity = 1.0;
                  _color = Colors.green;
                  _width = 500;
                });
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: StackedPageWithTitleAndList(
                  controller: widget.controller,
                  spacing: 30,
                  children: [
                    Text('What can we do next?'),
                    Text(
                      'Like this',
                      style: TextStyle(fontSize: 50),
                    ),
                  ],
                ),
              ),
              AnimatedOpacity(
                  duration: Duration(milliseconds: 200),
                  opacity: _opacity,
                  child: Container(
                    margin: EdgeInsets.only(right: 100),
                    width: _width,
                    height: 700,
                    child: Center(
                        child: AuthPage()
                    ),
                  )
              ),
            ],
          ),
        ],
      ),
    );
  }
}
