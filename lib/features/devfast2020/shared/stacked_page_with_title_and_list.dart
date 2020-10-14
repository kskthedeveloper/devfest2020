import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

class StackedPageWithTitleAndList extends StatefulWidget {
  const StackedPageWithTitleAndList({
    Key key,
    @required this.controller,
    @required this.children,
    @required this.spacing,
  }) : super(key: key);
  final PresentationController controller;
  final List<Widget> children;
  final double spacing;

  @override
  _StackedPageWithTitleAndListState createState() => _StackedPageWithTitleAndListState();
}

class _StackedPageWithTitleAndListState extends State<StackedPageWithTitleAndList>
    with SingleTickerProviderStateMixin {
  PageStepper<int> _stateController;
  AnimationController _controller;
  int _visibleChildren = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _stateController = PageStepper<int>(
      controller: widget.controller,
      steps: List.generate(widget.children.length + 2, (index) => index),
    );
    for (int step = 0; step < widget.children.length; step++) {
      _stateController.add(
        fromStep: step,
        toStep: step + 1,
        forward: () => setState(() => _visibleChildren++),
        reverse: () => setState(() => _visibleChildren--),
      );
    }
    _stateController
      ..add(
        fromStep: widget.children.length,
        toStep: widget.children.length + 1,
        forward: widget.controller.nextSlide,
      )
      ..build();
  }

  @override
  void dispose() {
    _controller.dispose();
    _stateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: Theme.of(context).textTheme.headline5,
      child: Stack(
        children: widget.children.mapIndexed<Widget>((index, item) {
          if(index == 0 ) {
            return AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              top: _visibleChildren != 0 ? 100.0 : 450.0,
              left: _visibleChildren != 0 ? 10.0 : 200.0,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                // opacity: _visibleChildren > index ? 1 : 0,
                opacity:  1,
                child: item,
              ),
            );
          }
          return Positioned(
            // top: (250.0 * index) - (10 * index),
            top: index == 1 ? 250 : 210 + (index.toDouble() * widget.spacing) + (index.toDouble() * widget.spacing),
            left: 100,
            child: Row(
              children: [
                index == 1 ? SizedBox(width: 0) : SizedBox(width: 100,),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: _visibleChildren > index ? 1 : 0,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.all(Radius.circular(25.0))
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Container(
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: _visibleChildren > index ? 1 : 0,
                    child: item,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

extension IterableEx<T> on Iterable<T> {
  Iterable<R> mapIndexed<R>(R Function(int index, T item) mapper) sync* {
    int i = 0;
    for (final value in this) {
      yield mapper(i++, value);
    }
  }
}