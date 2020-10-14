import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/devfast2020/shared/stacked_page_with_title.dart';
import 'package:flutter_presentations/features/devfast2020/shared/stacked_page_with_title_and_list.dart';
import 'package:flutter_presentations/shared/stacked_page.dart';
import 'package:presentation/presentation.dart';
import 'package:vector_math/vector_math_64.dart' as vmath;

class BuiltInExample extends StatelessWidget {
  const BuiltInExample(
      this.controller, {
        Key key,
      }) : super(key: key);
  final PresentationController controller;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: Theme.of(context).textTheme.headline5,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: StackedPageWithTitleAndList(
              controller: controller,
              spacing: 30,
              children: const [
                Text('Built-in Implicits Animation'),
                Text(
                  'What do we need?',
                  style: TextStyle(fontSize: 50),
                ),
                Text(
                  'Start Value and End Value',
                  style: TextStyle(fontSize: 50),
                ),
                Text(
                  'Duration',
                  style: TextStyle(fontSize: 50),
                ),
                Text(
                  'Curve',
                  style: TextStyle(fontSize: 50),
                ),
              ],
            ),
          ),
          Center(child: Example()),
        ],
      ),
    );
  }
}

class Example extends StatefulWidget {
  Example({Key key}) : super(key: key);

  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  static const double _startWidth = 300.0;
  static const double _startHeight = 300.0;
  static const Color _startColor = Colors.red;
  static double _opacity = 0;
  var _borderSize = 1.0;
  var _borderRadius = 0.0;
  var _rotation = 0.0;
  var _duration = Duration(milliseconds: 500);
  var _curve = Curves.linear;

  var _boxShadow = [
    BoxShadow(
      color: Colors.grey,
      offset: Offset(15.0, 10.0),
      blurRadius: 20.0,
    )
  ];

  final _random = Random();

  double width = _startWidth;
  double height = _startHeight;
  Color color = _startColor;

  void _animateContainer() {
    setState(() {
      width = (width == _startWidth) ? _startWidth / 2 : _startWidth;
      height = (height == _startHeight) ? _startHeight / 2 : _startHeight;
      color = (color == _startColor) ? Colors.blue : _startColor;
      _opacity = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: _animateContainer,
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 500),
            opacity: _opacity,
            child: AnimatedContainer(
              curve: _curve,
              decoration: BoxDecoration(
                border: Border.all(width: _borderSize),
                boxShadow: _boxShadow,
                borderRadius: BorderRadius.circular(_borderRadius),
                color: color,
              ),
              duration: _duration,
              width: height,
              height: height,
              transform: Matrix4.translation(vmath.Vector3(0, 0, 0))
                ..rotateZ(_rotation),
            ),
          ),
        ),
        Row(
          children: [
            FlatButton(
              onPressed: () {
                setState(() {
                  _duration = Duration(milliseconds: 1000);
                });
              },
              child: const Text(
                '1000',
                style: TextStyle(color: Colors.black),
              ),
            ),
            FlatButton(
              onPressed: () {
                setState(() {
                  _duration = Duration(milliseconds: 200);
                });
              },
              child: const Text(
                '200',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
        Row(
          children: [
            FlatButton(
              onPressed: () {
                setState(() {
                  _curve = Curves.linear;
                });
              },
              child: const Text(
                'Linear',
                style: TextStyle(color: Colors.black),
              ),
            ),
            FlatButton(
              onPressed: () {
                setState(() {
                  _curve = Curves.bounceIn;
                });
              },
              child: const Text(
                'BounceIn',
                style: TextStyle(color: Colors.black),
              ),
            ),
            FlatButton(
              onPressed: () {
                setState(() {
                  _curve = Curves.bounceOut;
                });
              },
              child: const Text(
                'BounceOut',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        )
      ],
    );
  }
}
