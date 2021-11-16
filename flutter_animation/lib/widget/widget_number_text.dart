import 'package:flutter/material.dart';
import 'package:linus_fortune_wheel/widget/widget_animated_number.dart';

//封装文本组件的widget，局部刷新
class WidgetNumberText extends StatefulWidget {
  final int number;
  final TextStyle numberStyle;
  final TextOverflow overflow;
  const WidgetNumberText({
    Key? key,
    required this.number,
    required this.numberStyle,
    this.overflow = TextOverflow.ellipsis
  }) : super(key: key);

  @override
  WidgetNumberTextState createState() => WidgetNumberTextState();
}

class WidgetNumberTextState extends State<WidgetNumberText> {
  int number = 0;

  @override
  void initState() {
    super.initState();
    number = widget.number;
  }

  void onSetState(int newNumber) {
    this.number = newNumber;
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return WidgetAnimatedNumber(
        number: number,
        style: widget.numberStyle);
  }
}
