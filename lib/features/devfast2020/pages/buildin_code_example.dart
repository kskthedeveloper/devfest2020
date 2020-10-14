import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_presentations/features/coding/coding.dart';
import 'package:presentation/presentation.dart';

class BuiltInCodeExample extends StatefulWidget {
  const BuiltInCodeExample({Key key}) : super(key: key);
  @override
  _BuiltInCodeExampleState createState() => _BuiltInCodeExampleState();
}

class _BuiltInCodeExampleState extends State<BuiltInCodeExample> {
  Brightness _brightness = Brightness.dark;
  String text = complex;
  double _opacity = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // _brightness = _brightness == Brightness.dark
          //     ? Brightness.light
          //     : Brightness.dark;
          text = text == complex ? reduce : complex;

          _opacity = 0.9;

          Timer(new Duration(milliseconds: 500), () {
            setState(() {
              _opacity = 1;
            });
          });

        });
      },
      child: AnimatedOpacity(
        opacity: _opacity,
        duration: Duration(milliseconds: 300),
        child: Center(
          child: Editor(
            text,
            brightness: _brightness,
            padding: const EdgeInsets.only(left: 300, top: 200),
            fontSize: 30,
            children: const [
              AnimatedColor(
                begin: Colors.red,
                end: Colors.yellowAccent,
                child: SizedBox(
                  height: 20,
                  width: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const complex = '''
class AnimatedContainerExample extends StatefulWidget {
  @override
  _AnimatedContainerState createState() => _AnimatedContainerState();
}

class _AnimatedContainerState extends State<AnimatedContainerExample> {
  var _width = 100.0; {0}
  var _height = 100.0; {0}

  @override
  Widget build(BuildContext context) {
    return GestureDetector (
      child: AnimatedContainer {0} (
        width: _width,
        height: _height,
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
        ),
      ),
      onTap: () {
        setState(() {
          _width = 200.0; {0}
          _height = 200.0; {0}
        });
      },
    );
  }
}
''';

const reduce = '''
    AnimatedContainer( {0}
      width: _width,
      height: _height,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
      ),
    );
    
     setState(() {
          _width = 200.0; {0}
          _height = 200.0; {0}
     });
''';

const test2 = r'''
import 'package:animation_cheat_page/shared/material_import.dart';
import 'package:flutter_presentations/features/coding/pages/split.dart';
import 'package:flutter_presentations/shared/colors.dart';

class Editor extends StatefulWidget {
  const Editor(
    this.data, {
    Key key,
    this.brightness = Brightness.dark,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  final String data;
  final Brightness brightness;
  final EdgeInsetsGeometry padding;

  @override
  _EditorState createState() => _EditorState();
}

class _EditorState extends State<Editor> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )
      ..value = widget.brightness == Brightness.dark ? 0 : 1
      ..addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(Editor oldWidget) {
    if (oldWidget.brightness != widget.brightness) {
      if (widget.brightness == Brightness.dark) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final lines = widget.data.split('\r\n');
    return Container(
      color: EditorColor.background.lerp(_controller.value),
      child: Scrollbar(
        child: ListView.builder(
          padding: widget.padding,
          itemCount: lines.length,
          itemBuilder: (context, index) {
            return EditorLine(
              lines[index],
              animation: _controller,
            );
          },
        ),
      ),
    );
  }
}

class EditorLine extends StatelessWidget {
  const EditorLine(
    this.data, {
    @required this.animation,
    Key key,
  }) : super(key: key);

  final String data;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(children: _create(data, animation).toList(growable: false)),
      style: TextStyle(
        fontFamily: 'Consolas',
        fontWeight: FontWeight.w300,
        color: EditorColor.plain.lerp(animation.value),
        fontSize: 20,
      ),
    );
  }
}
''';


