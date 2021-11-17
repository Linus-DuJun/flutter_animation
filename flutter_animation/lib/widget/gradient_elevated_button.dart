import 'package:flutter/material.dart';
import 'package:linus_fortune_wheel/utils/click_util.dart';

class GradientElevatedButton extends StatelessWidget {
  final VoidCallback callback;
  final String label;
  final TextStyle labelStyle;
  final List<Color> gradientColors;
  final double buttonHeight;
  final double buttonWidth;
  final double radius;
  const GradientElevatedButton({
    required this.callback,
    required this.label,
    required this.gradientColors,
    this.labelStyle = const TextStyle(color: Colors.white),
    this.buttonHeight = 56,
    this.buttonWidth = double.infinity,
    this.radius = 32,
    Key? key}
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: ClickUtil.debounce(() { callback(); }),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shadowColor: MaterialStateProperty.all(Colors.transparent)
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColors
            ),
            borderRadius: BorderRadius.circular(radius),
            boxShadow: [
              BoxShadow(
                color: gradientColors[0],
                blurRadius: 0.5,
                offset: Offset(0.0, 0.25)
              )
            ]
          ),
          child: Container(
            alignment: Alignment.center,
            width: buttonWidth,
            height: buttonHeight,
            child: Text(label, style: labelStyle,),
          ),
        )
    );
  }
}
