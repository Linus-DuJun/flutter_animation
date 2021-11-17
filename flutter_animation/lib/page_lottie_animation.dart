import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:linus_fortune_wheel/configs/resources/app_res.dart';
import 'package:linus_fortune_wheel/page_lottie_anim_detail.dart';
import 'package:linus_fortune_wheel/utils/ui_util.dart';
import 'package:linus_fortune_wheel/widget/gradient_elevated_button.dart';

class PageLottieAnimation extends StatefulWidget {
  const PageLottieAnimation({Key? key}) : super(key: key);

  @override
  _PageLottieAnimationState createState() => _PageLottieAnimationState();
}

class _PageLottieAnimationState extends State<PageLottieAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GradientElevatedButton(
              callback: (){ _showAnimation(AppRes.LOTTIE_WIN_BACKGROUND);},
              label: "WIN BACKGROUND ANIM",
              labelStyle: _getButtonTextStyle(),
              gradientColors: [Colors.tealAccent, Colors.teal]),
          const SizedBox(height: 16,),

          GradientElevatedButton(
              callback: (){ _showAnimation(AppRes.LOTTIE_WIN);},
              label: "NORMAL WIN",
              labelStyle: _getButtonTextStyle(),
              gradientColors: [Colors.tealAccent, Colors.teal]),
          const SizedBox(height: 16,),

          GradientElevatedButton(
              callback: (){ _showAnimation(AppRes.LOTTIE_WIN_BIG);},
              label: "BIG WIN",
              labelStyle: _getButtonTextStyle(),
              gradientColors: [Colors.tealAccent, Colors.teal]),
          const SizedBox(height: 16,),

          GradientElevatedButton(
              callback: (){ _showAnimation(AppRes.LOTTIE_GET_COIN);},
              label: "GOT COIN",
              labelStyle: _getButtonTextStyle(),
              gradientColors: [Colors.tealAccent, Colors.teal]),
          const SizedBox(height: 16,),

          GradientElevatedButton(
              callback: (){ _showAnimation(AppRes.LOTTIE_LUCKY_SPIN);},
              label: "LUCKY SPIN",
              labelStyle: _getButtonTextStyle(),
              gradientColors: [Colors.tealAccent, Colors.teal]),
          const SizedBox(height: 16,),

          GradientElevatedButton(
              callback: (){ _showAnimation(AppRes.LOTTIE_LUCKY_NUMBER);},
              label: "LUCKY NUMBER",
              labelStyle: _getButtonTextStyle(),
              gradientColors: [Colors.tealAccent, Colors.teal]),
          const SizedBox(height: 16,),

        ],
      ),
    );
  }

  void _showAnimation(String animName) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => PageLottieAnimDetails(animName: animName))
    );
  }

  TextStyle _getButtonTextStyle() {
    return TextStyle(color: Colors.white);
  }
}
