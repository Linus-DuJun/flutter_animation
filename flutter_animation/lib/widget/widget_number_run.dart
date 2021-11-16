import 'package:flutter/material.dart';

/// 数字递增变化
class WidgetNumberRun extends StatefulWidget {
  final int number;
  final TextStyle style;
  final TextOverflow overflow;

  const WidgetNumberRun({
    Key? key,
    required this.number,
    required this.style,
    this.overflow = TextOverflow.ellipsis
  }) : super(key: key);

  @override
  WidgetNumberRunState createState() => WidgetNumberRunState();
}

class WidgetNumberRunState extends State<WidgetNumberRun>
  with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation _animation;
  late int number;

  @override
  void initState() {
    number = widget.number;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000)
    );
    _animation = IntTween(
      begin: number < 100 ? 0 : number - 100,
      end: number
    ).animate(_controller);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant WidgetNumberRun oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!mounted) return;
    if (number != widget.number) {
      _controller.reset();
      _animation = IntTween(
        begin: number, end: widget.number
      ).animate(_controller);
      number = widget.number;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return AnimatedBuilder(
        animation: _animation,
        builder: (context, Widget? child) {
          return Text(
            "${_animation.value}",
            style: widget.style, overflow: widget.overflow,
          );
        });
  }
}
