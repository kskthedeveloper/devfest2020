import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/devfast2020/shared/stacked_page_with_title.dart';
import 'package:flutter_presentations/features/devfast2020/shared/stacked_page_with_title_and_list.dart';
import 'package:flutter_presentations/shared/stacked_page.dart';
import 'package:presentation/presentation.dart';
import 'package:vector_math/vector_math_64.dart' as vmath;

class StaggeredAnimationIntro extends StatefulWidget {
  const StaggeredAnimationIntro(
      this.controller, {
        Key key,
      }) : super(key: key);
  final PresentationController controller;

  @override
  _StaggeredAnimationIntroState createState() => _StaggeredAnimationIntroState();
}

class _StaggeredAnimationIntroState extends State<StaggeredAnimationIntro> {

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
                Text('Staggered Animation'),
                Text(
                  'What do we need to know',
                  style: TextStyle(fontSize: 50),
                ),
                Text(
                  'Animation Controller',
                  style: TextStyle(fontSize: 50),
                ),
                Text(
                  'Tween',
                  style: TextStyle(fontSize: 50),
                ),
                Text(
                  'Animation',
                  style: TextStyle(fontSize: 50),
                ),
                Text(
                  'CurvedAnimation',
                  style: TextStyle(fontSize: 50),
                ),
                Text(
                  'Intervals',
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
