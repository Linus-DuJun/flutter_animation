import 'package:flutter/material.dart';
import 'package:linus_fortune_wheel/utils/click_util.dart';

class WidgetPressStatefulButton extends StatefulWidget {
  final String normalStateImage;
  final String pressedStateImage;
  final String unpressedStateImage;
  final double width;
  final double height;
  final Widget? child;
  final Widget? child2;
  final double? top;
  final double? top2;
  final VoidCallback? onTap;

  const WidgetPressStatefulButton({
    required this.normalStateImage,
    required this.pressedStateImage,
    required this.unpressedStateImage,
    required this.width,
    required this.height,
    this.child,
    this.child2,
    this.onTap,
    this.top,
    this.top2,
    Key? key,
  }) : super(key: key);

  @override
  WidgetPressStatefulButtonState createState() => WidgetPressStatefulButtonState();
}

class WidgetPressStatefulButtonState extends State<WidgetPressStatefulButton> {
  bool _buttonPressed = false;
  bool _buttonEnabled = true;
  int _clickTimestamp = 0;

  void setEnabledImage(bool enabled) {
    if (_buttonEnabled != enabled) {
      _buttonEnabled = enabled;
      setState(() { });
    }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: widget.child != null ? _getChildNotNullView() : _getChildNullView(),
      onTapDown: (TapDownDetails details) {
        print("onTapDown");
        if (!_buttonEnabled) {
          return;
        }
        _buttonPressed = true;
        _clickTimestamp = DateTime.now().millisecondsSinceEpoch;
        setState(() { });
      },
      onTapUp: (TapUpDetails details) {
        print("onTapUp");
        if (!_buttonEnabled) {
          return;
        }
        if (DateTime.now().millisecondsSinceEpoch - _clickTimestamp >= 200) {
          _buttonPressed = false;
          setState(() { });
        } else {
          Future.delayed(const Duration(milliseconds: 200), () {
            _buttonPressed = false;
            setState(() { });
          });
        }
      },
      onTapCancel: () {
        print("onTapCancel");
        if (!_buttonEnabled) {
          return;
        }
        if (DateTime.now().millisecondsSinceEpoch - _clickTimestamp >= 200) {
          _buttonPressed = false;
          setState(() { });
        } else {
          Future.delayed(const Duration(milliseconds: 200), () {
            _buttonPressed = false;
            setState(() { });
          });
        }
      },
      onTap: ClickUtil.debounce(() {
        print("onTap");
        if (!_buttonEnabled) return;
        widget.onTap?.call();
      }),
    );
  }

  Stack _getChildNotNullView() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(_getImageRes(),
          fit: BoxFit.fill,
          width: widget.width,
          height: widget.height,
        ),
        Positioned(
          top: _buttonPressed ? widget.top2 : widget.top,
          child: widget.child!,
        ),
        Positioned(
          top: _buttonPressed ? widget.top2 : widget.top,
          child: widget.child2 ?? Container(),
        )
      ],
    );
  }

  Image _getChildNullView() {
    return Image.asset(_getImageRes(),
      fit: BoxFit.fill,
      width: widget.width,
      height: widget.height,
    );
  }

  String _getImageRes() {
    return !_buttonEnabled
        ? widget.unpressedStateImage
        : _buttonPressed
          ? widget.pressedStateImage
          : widget.normalStateImage;
  }
}
