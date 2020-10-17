import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/devfast2020/shared/stacked_page_with_title.dart';
import 'package:flutter_presentations/features/devfast2020/shared/stacked_page_with_title_and_list.dart';
import 'package:flutter_presentations/shared/stacked_page.dart';
import 'package:presentation/presentation.dart';
import 'package:vector_math/vector_math_64.dart' as vmath;

class Thanks extends StatefulWidget {
  const Thanks(
      this.controller, {
        Key key,
      }) : super(key: key);
  final PresentationController controller;

  @override
  _ThanksState createState() => _ThanksState();
}

class _ThanksState extends State<Thanks> {

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: Theme.of(context).textTheme.headline5,
      child: Row(
        children: [
          Expanded(
            child: StackedPageWithTitleAndList(
              controller: widget.controller,
              spacing: 30,
              children: const [
                Text('Thank you'),
                Text(
                  'any question?',
                  style: TextStyle(fontSize: 50),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
              child: QAndA()
          )
        ],
      ),
    );
  }
}

class QAndA extends StatefulWidget {
  QAndA({Key key}) : super(key: key);

  _QAndAState createState() =>
      _QAndAState();
}

class _QAndAState extends State<QAndA>
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

    _controller.repeat(reverse: true);
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
      child: ScaleTransition(
        scale: _rotationAnimation,
        child: Container(
            child: Text('Q & A'),
        ),
      ),
    );
  }
}


