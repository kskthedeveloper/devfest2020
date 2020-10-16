import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/devfast2020/shared/stacked_page_with_title.dart';
import 'package:flutter_presentations/shared/stacked_page.dart';
import 'package:presentation/presentation.dart';

class NextStep extends StatelessWidget {
  const NextStep(
      this.controller, {
        Key key,
      }) : super(key: key);
  final PresentationController controller;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: Theme.of(context).textTheme.headline5,
      child: StackedPageWithTitle(
        size: 500,
        controller: controller,
        spacing: MediaQuery.of(context).size.width / 4.5,
        children: [
          Text('Next Step'),
          Image.asset('assets/ns.jpg'),
        ],
      ),
    );
  }
}