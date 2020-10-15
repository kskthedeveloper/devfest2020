import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/devfast2020/shared/stacked_page_with_title.dart';
import 'package:flutter_presentations/features/devfast2020/shared/stacked_page_with_title_and_list.dart';
import 'package:flutter_presentations/shared/stacked_page.dart';
import 'package:presentation/presentation.dart';
import 'package:vector_math/vector_math_64.dart' as vmath;

class ImplicitAnimation extends StatefulWidget {
  const ImplicitAnimation(
    this.controller, {
    Key key,
  }) : super(key: key);
  final PresentationController controller;

  @override
  _ImplicitAnimationState createState() => _ImplicitAnimationState();
}

class _ImplicitAnimationState extends State<ImplicitAnimation> {
  double _opacity = 0.0;
  var _color = Colors.lightBlue;

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
                    Text('Implicit Animation'),
                    Text(
                      'Built In (AnimatedFoo)',
                      style: TextStyle(fontSize: 50),
                    ),
                    Text(
                      'AnimatedOpacity',
                      style: TextStyle(fontSize: 50),
                    ),
                    Text(
                      'AnimatedContainer',
                      style: TextStyle(fontSize: 50),
                    ),
                    Text(
                      'AnimatedPositioned',
                      style: TextStyle(fontSize: 50),
                    ),
                    Text(
                      'AnimatedSize',
                      style: TextStyle(fontSize: 50),
                    ),
                  ],
                ),
              ),
              AnimatedOpacity(
                duration: Duration(milliseconds: 200),
                opacity: _opacity,
                child: Center(
                   child: Example()
                )
              ),
            ],
          ),
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedOpacity(
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
            duration: Duration(milliseconds: 500),
            width: height,
            height: height,
            transform: Matrix4.translation(vmath.Vector3(0, 0, 0))
              ..rotateZ(_rotation),
          ),
        ),
        Row(
          children: [
            FlatButton(
              onPressed: () {
                setState(() {
                  _opacity = _opacity == 1 ? 0 : 1;
                });
              },
              child: const Text(
                'Opacity',
                style: TextStyle(color: Colors.black),
              ),
            ),
            FlatButton(
              onPressed: () {
                setState(_animateContainer);
              },
              child: const Text(
                'Container',
                style: TextStyle(color: Colors.black),
              ),
            ),
            FlatButton(
              onPressed: () {
                setState(() {
                  _borderSize = _random.nextInt(10).toDouble();
                });
              },
              child: const Text(
                'BorderSize',
                style: TextStyle(color: Colors.black),
              ),
            ),
            FlatButton(
              onPressed: () {
                setState(() {
                  _boxShadow = [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(_random.nextInt(20).toDouble(),
                          _random.nextInt(20).toDouble()),
                      blurRadius: _random.nextInt(30).toDouble(),
                    )
                  ];
                });
              },
              child: const Text(
                'Shadow',
                style: TextStyle(color: Colors.black),
              ),
            ),
            FlatButton(
              onPressed: () {
                setState(() {
                  _rotation = _random.nextInt(200).toDouble();
                });
              },
              child: const Text(
                'Rotation',
                style: TextStyle(color: Colors.black),
              ),
            ),
            FlatButton(
              onPressed: () {
                setState(() {
                  _borderRadius = _random.nextInt(100).toDouble();
                });
              },
              child: const Text(
                'BorderRadius',
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
            FlatButton(
              onPressed: () {
                setState(() {
                  _curve = Curves.bounceInOut;
                });
              },
              child: const Text(
                'BounceInOut',
                style: TextStyle(color: Colors.black),
              ),
            ),
            FlatButton(
              onPressed: () {
                setState(() {
                  _curve = Curves.easeIn;
                });
              },
              child: const Text(
                'EaseIn',
                style: TextStyle(color: Colors.black),
              ),
            ),
            FlatButton(
              onPressed: () {
                setState(() {
                  _curve = Curves.easeOut;
                });
              },
              child: const Text(
                'EaseOut',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        )
      ],
    );
  }
}
