import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/devfast2020/shared/stacked_page_with_title.dart';
import 'package:flutter_presentations/features/devfast2020/shared/stacked_page_with_title_and_list.dart';
import 'package:flutter_presentations/shared/stacked_page.dart';
import 'package:presentation/presentation.dart';
import 'package:vector_math/vector_math_64.dart' as vmath;

class Credit extends StatefulWidget {
  const Credit(
      this.controller, {
        Key key,
      }) : super(key: key);
  final PresentationController controller;

  @override
  _CreditState createState() => _CreditState();
}

class _CreditState extends State<Credit> {

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
                Text('Credit & References'),
                Text(
                  'Fun With Flutter',
                  style: TextStyle(fontSize: 50),
                ),
                Text(
                  'https://github.com/funwithflutter/mastering_animation_course',
                  style: TextStyle(fontSize: 50),
                ),
                Text(
                  'https://flutter.dev/docs/development/ui/animations',
                  style: TextStyle(fontSize: 50),
                ),
                Text(
                  'https://github.com/Solido/awesome-flutter',
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
