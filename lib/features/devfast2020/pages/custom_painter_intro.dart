import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/devfast2020/shared/stacked_page_with_title.dart';
import 'package:flutter_presentations/features/devfast2020/shared/stacked_page_with_title_and_list.dart';
import 'package:flutter_presentations/shared/stacked_page.dart';
import 'package:presentation/presentation.dart';
import 'package:vector_math/vector_math_64.dart' as vmath;

class CustomPainterIntro extends StatefulWidget {
  const CustomPainterIntro(
      this.controller, {
        Key key,
      }) : super(key: key);
  final PresentationController controller;

  @override
  _CustomPainterIntroState createState() => _CustomPainterIntroState();
}

class _CustomPainterIntroState extends State<CustomPainterIntro> {

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
                Text('CustomPainter'),
                Text(
                  'To draw unique widgets/shapes',
                  style: TextStyle(fontSize: 50),
                ),
                Text(
                  'CustomPaint',
                  style: TextStyle(fontSize: 50),
                ),
                Text(
                  'CustomPainter',
                  style: TextStyle(fontSize: 50),
                ),
                Text(
                  'Canvas',
                  style: TextStyle(fontSize: 50),
                ),
                Text(
                  'Paint',
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
