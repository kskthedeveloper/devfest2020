import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/big_applications/pages/the_app.dart';
import 'package:flutter_presentations/features/devfast2020/pages/animation_type.dart';
import 'package:flutter_presentations/features/devfast2020/pages/arrow_test.dart';
import 'package:flutter_presentations/features/devfast2020/pages/buildin_code_example.dart';
import 'package:flutter_presentations/features/devfast2020/pages/buildin_example.dart';
import 'package:flutter_presentations/features/devfast2020/pages/curve_visualizer.dart';
import 'package:flutter_presentations/features/devfast2020/pages/documentation_time.dart';
import 'package:flutter_presentations/features/devfast2020/pages/first_one_with_animation.dart';
import 'package:flutter_presentations/features/devfast2020/pages/flutter.dart';
import 'package:flutter_presentations/features/devfast2020/pages/implicit_animation.dart';
import 'package:flutter_presentations/features/devfast2020/pages/intro_page.dart';
import 'package:flutter_presentations/features/devfast2020/pages/next_step.dart';
import 'package:flutter_presentations/features/devfast2020/pages/the_basic.dart';
import 'package:flutter_presentations/features/devfast2020/pages/the_beginning.dart';
import 'package:flutter_presentations/features/devfast2020/pages/tween_animaition_builder.dart';
import 'package:flutter_presentations/features/devfast2020/pages/tween_animation_builder_code_example.dart';
import 'package:flutter_presentations/features/devfast2020/pages/wavy_slider.dart';
import 'package:flutter_presentations/features/devfast2020/pages/what_is_flutter.dart';
import 'package:flutter_presentations/shared/logo.dart';
import 'package:flutter_presentations/shared/stacked_page.dart';
import 'package:flutter_presentations/shared/themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:presentation/presentation.dart';

class DevFast2020 extends StatefulWidget {
  const DevFast2020({Key key}) : super(key: key);

  static const String title = 'Animation';
  static const String subtitle = 'in Flutter';

  @override
  _DevFast2020State createState() => _DevFast2020State();
}

class _DevFast2020State extends State<DevFast2020> {
  PageController controller;
  PresentationController presentationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = PageController();
    presentationController = PresentationController(
      controller: controller,
      animationDuration: const Duration(milliseconds: 600),
    );
  }

  @override
  void dispose() {
    presentationController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: blueDark(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Builder(
          builder: (_) {
            final children = [
              const IntroPage(),
              ExampleApp(),
              Flutter(presentationController),
              WhatIsFlutter(presentationController),
              TheBasic(presentationController),
              TheBeginning(presentationController),
              FirstOneWithAnimation(presentationController),
              NextStep(presentationController),
              WavySlider(presentationController),
              DocumentationTime(presentationController),
              AnimationType(presentationController),
              ImplicitAnimation(presentationController),
              BuiltInExample(presentationController),
              BuiltInCodeExample(),
              TweenAnimationBuilderIntro(presentationController),
              TweenAnimationBuilderCodeExample(),
              TweenAnimationBuilderTest(),
              CurveVisualizer(),

              TheApp(presentationController),// to detlete
            ];

            return Stack(
              fit: StackFit.expand,
              children: [
                Presentation(
                  controller: controller,
                  presentationController: presentationController,
                  children: children,
                ),
                Positioned(
                  bottom: 0,
                  left: 20,
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (_, __) {
                      final page = controller.page ?? 0.0;
                      return Logo(
                        visible: (page * 1000).floor() % 1000 == 0,
                        child: Row(
                          children: [
                            Image.asset('assets/gdg.png', height: 110),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}


