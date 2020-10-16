import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/devfast2020/shared/stacked_page_with_title.dart';
import 'package:flutter_presentations/features/devfast2020/shared/stacked_page_with_title_and_list.dart';
import 'package:flutter_presentations/shared/stacked_page.dart';
import 'package:presentation/presentation.dart';
import 'package:vector_math/vector_math_64.dart' as vmath;

class AnimationControllerIntro extends StatefulWidget {
  const AnimationControllerIntro(
      this.controller, {
        Key key,
      }) : super(key: key);
  final PresentationController controller;

  @override
  _AnimationControllerIntroState createState() => _AnimationControllerIntroState();
}

class _AnimationControllerIntroState extends State<AnimationControllerIntro> {
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
                Text('AnimationController'),
                Text(
                  'What do we need?',
                  style: TextStyle(fontSize: 50),
                ),
                Text(
                  'AnimationController',
                  style: TextStyle(fontSize: 50),
                ),
                Text(
                  '{Single}TickerProviderStateMixin',
                  style: TextStyle(fontSize: 50),
                ),
                Text(
                  'duration',
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

class AnimationControllerExample extends StatefulWidget {
  AnimationControllerExample({Key key}) : super(key: key);

  _AnimationControllerExampleState createState() =>
      _AnimationControllerExampleState();
}

class _AnimationControllerExampleState extends State<AnimationControllerExample>
    with TickerProviderStateMixin {
  AnimationController _sizeController;
  AnimationController _shadowController;

  double _size = 0;
  Tween<double> _shadowTween = Tween<double>(begin: 0, end: 200);

  Animation<double> _shadowAnimation;

  @override
  void initState() {
    _sizeController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    _shadowController = AnimationController(vsync: this, duration: Duration(seconds: 3));

    _sizeController.addListener(() {
      _setWidth(_sizeController.value * 300);
    });

    _shadowController.addListener(() {
      setState(() {
          
      });
    });

    Animation _curvedController = CurvedAnimation(
      parent: _shadowController,
      curve: Curves.bounceInOut,
      reverseCurve: Curves.bounceInOut
    );

    _shadowAnimation = _shadowTween.animate(_curvedController);

    super.initState();
  }

  void _setWidth(val) {
    setState(() {
      _size = val;
    });
  }

  @override
  void dispose() {
    _sizeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: _size,
                  height: _size,
                  color: Colors.lightBlue,
                )
              ],
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  child: Text('Forward'),
                  onPressed: () {
                    _sizeController.forward();
                  },
                ),
                RaisedButton(
                  child: Text('Reverse'),
                  onPressed: () {
                    _sizeController.reverse();
                  },
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
                )
              ],
            ),
          ],
        ),
        SizedBox(width: 100,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(_shadowAnimation.value, _shadowAnimation.value),
                        blurRadius: _shadowAnimation.value,
                      )
                    ],
                    color: Colors.lightBlue,
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  child: Text('Forward'),
                  onPressed: () {
                    _shadowController.forward();
                  },
                ),
                RaisedButton(
                  child: Text('Reverse'),
                  onPressed: () {
                    _shadowController.reverse();
                  },
                ),
                RaisedButton(
                  child: Text('Repeat'),
                  onPressed: () {
                    _shadowController.repeat(reverse: true);
                  },
                ),
                RaisedButton(
                  child: Text('Stop'),
                  onPressed: () {
                    _shadowController.stop();
                  },
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
