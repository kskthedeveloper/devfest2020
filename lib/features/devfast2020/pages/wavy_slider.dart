import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/devfast2020/shared/stacked_page_with_title.dart';
import 'package:flutter_presentations/features/devfast2020/shared/stacked_page_with_title_and_child.dart';
import 'package:flutter_presentations/shared/stacked_page.dart';
import 'package:presentation/presentation.dart';

class WavySlider extends StatelessWidget {
  const WavySlider(
      this.controller, {
        Key key,
      }) : super(key: key);
  final PresentationController controller;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: Theme.of(context).textTheme.headline5,
      child: StackedPageWithTitleAndChild(
        controller: controller,
        spacing: MediaQuery.of(context).size.width / 10,
        children: [
          Text('Wavy Slider'),
          Image.asset('assets/ui_2.gif'),
          Image.asset('assets/ui_2.gif'),
          Image.asset('assets/ui_2.gif'),
        ],
      ),
    );
  }
}