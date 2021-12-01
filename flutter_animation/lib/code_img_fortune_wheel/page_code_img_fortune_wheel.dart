import 'dart:math' as Math;
import 'package:flutter/material.dart';
import 'package:linus_fortune_wheel/code_img_fortune_wheel/board_view.dart';
import 'package:linus_fortune_wheel/code_img_fortune_wheel/luck_model.dart';
import 'package:linus_fortune_wheel/configs/resources/app_res.dart';

class PageCodeImgFortuneWheel extends StatefulWidget {
  const PageCodeImgFortuneWheel({Key? key}) : super(key: key);

  @override
  _PageCodeImgFortuneWheelState createState() => _PageCodeImgFortuneWheelState();
}

class _PageCodeImgFortuneWheelState extends State<PageCodeImgFortuneWheel>
  with SingleTickerProviderStateMixin {

  Size get size => Size(MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height);

  double _angle = 0;
  double _current = 0;
  late AnimationController _controller;
  late Animation _animation;
  List<LuckModel> _items = [
    LuckModel(image: "apple", color: Colors.accents[0]),
    LuckModel(image: "raspberry", color: Colors.accents[2]),
    LuckModel(image: "grapes", color: Colors.accents[4]),
    LuckModel(image: "fruit", color: Colors.accents[6]),
    LuckModel(image: "milk", color: Colors.accents[8]),
    LuckModel(image: "salad", color: Colors.accents[10]),
    LuckModel(image: "cheese", color: Colors.accents[12]),
    LuckModel(image: "carrot", color: Colors.accents[14]),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.fastLinearToSlowEaseIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            final _value = _animation.value;
            final _angle = _value * this._angle;
            return Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(AppRes.IMG_LOTTERY_BG,
                  width: size.width,
                  height: size.height,
                  fit: BoxFit.cover,
                ),
                BoardView(angle: _angle, current: _current, items: _items),
                _buildStartButton(),
                _buildResult(_value)
              ],
            );
          },
        )
      )
    );
  }

  Material _buildStartButton() {
    return Material(
      color: Colors.transparent,
      shape: CircleBorder(),
      child: InkWell(
        customBorder: CircleBorder(),
        child: Container(
          alignment: Alignment.center,
          height: 108,
          width: 108,
          padding: EdgeInsets.only(bottom: 16),
          child: Image.asset(AppRes.IMG_WHEEL_INDICATOR,)
        ),
        onTap: _animate,
      ),
    );
  }

  void _animate() {
    if (!_controller.isAnimating) {
      var _random = Math.Random().nextDouble();
      _angle = 20 + Math.Random().nextInt(5) + _random;
      _controller.forward(from: 0.0).then((_) {
        _current = (_current + _random);
        _current = _current - _current ~/ 1;
        _controller.reset();
      });
    }
  }
  
  int _calIndex(double value) {
    var base = (2 * Math.pi / _items.length / 2) / (2 * Math.pi);
    return (((base + value) % 1) * _items.length).floor();
  }
  
  Padding _buildResult(double value) {
    var _index = _calIndex(value * _angle + _current);
    String _asset = _items[_index].asset;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Align(
        alignment: Alignment.bottomCenter,  
        child: Image.asset(_asset, height: 80, width: 80,),
      ),
    );
  }
}
