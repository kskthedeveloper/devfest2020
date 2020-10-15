import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/devfast2020/shared/stacked_page_with_title.dart';
import 'package:flutter_presentations/features/devfast2020/shared/stacked_page_with_title_and_list.dart';
import 'package:flutter_presentations/shared/stacked_page.dart';
import 'package:presentation/presentation.dart';

class TweenAnimationBuilderIntro extends StatelessWidget {
  const TweenAnimationBuilderIntro(
      this.controller, {
        Key key,
      }) : super(key: key);
  final PresentationController controller;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: Theme.of(context).textTheme.headline5,
      child: StackedPageWithTitleAndList(
        controller: controller,
        spacing: 60,
        children: [
          Text('Custom Implicit Animation'),
          Text('TweenAnimationBuilder'),
          Text('tween // between'),
          Text('start point, end point'),
          Text('duration'),
          Text('curve'),
          Text('builder'),
        ],
      ),
    );
  }
}

class TweenAnimationBuilderTest extends StatefulWidget {
  @override
  _TweenAnimationBuilderTestState createState() => _TweenAnimationBuilderTestState();
}

class _TweenAnimationBuilderTestState extends State<TweenAnimationBuilderTest> {
  double targetValue = 30;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(targetValue);
        setState(() {
          targetValue = targetValue == 10 ? 30 : 10;
        });
      },
      child: Stack(
        children: [
          Positioned(
              top: 300,
              left: 30,
              child: Row(
                children: [
                  Text('Start'),
                  Container(
                      width: 320.0,
                      height: 2.0,
                      color: Colors.lightBlue
                  ),
                ],
              )
          ),
          Positioned(
              top: 700,
              left: 30,
              child: Row(
                children: [
                  Text('End'),
                  Container(
                      width: 350.0,
                      height: 2.0,
                      color: Colors.lightBlue
                  ),
                ],
              )
          ),
          Positioned(
            top: 100.0,
            left: 500,
            child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: targetValue),
              duration: Duration(milliseconds: 3000),
              builder: (BuildContext context, double _val, Widget child) {
                return Opacity(
                  opacity: _val /targetValue > 1 ? 1 : (_val /targetValue),
                  child: Padding(
                    padding: EdgeInsets.only(top: _val * 20),
                    child: child,
                  ),
                );
              },
              child: Center(child: Text('Custom Implicit Animation')),
            ),
          ),
        ],
      ),
    );
  }
}

