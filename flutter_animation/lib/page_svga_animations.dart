import 'package:flutter/material.dart';
import 'package:linus_fortune_wheel/utils/dialog_util.dart';
import 'package:linus_fortune_wheel/widget/gradient_elevated_button.dart';
import 'package:linus_fortune_wheel/widget/widget_svga_player.dart';

class PageSvgaAnimations extends StatefulWidget {
  const PageSvgaAnimations({Key? key}) : super(key: key);

  @override
  _PageSvgaAnimationsState createState() => _PageSvgaAnimationsState();
}

class _PageSvgaAnimationsState extends State<PageSvgaAnimations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("特效列表"),
        centerTitle: true,
        backgroundColor: Colors.tealAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GradientElevatedButton(
              callback: _showAircraftAnimation,
              label: "太空飞船特效",
              labelStyle: TextStyle(color: Colors.redAccent),
              gradientColors: [Colors.tealAccent, Colors.teal]),
          const SizedBox(height: 16,),
          GradientElevatedButton(
              callback: _showCondomAnimation,
              label: "套套特效",
              gradientColors: [Colors.orangeAccent, Colors.orange]),
          const SizedBox(height: 16,),
          GradientElevatedButton(
              callback: _showDiamondRingAnimation,
              label: "钻戒特效",
              gradientColors: [Colors.greenAccent, Colors.lightGreenAccent]),
          const SizedBox(height: 16,),
          GradientElevatedButton(
              callback: _showFireWorksAnimation,
              label: "烟花特效",
              gradientColors: [Colors.tealAccent, Colors.teal]),
          const SizedBox(height: 16,),
          GradientElevatedButton(
              callback: _showKissAnimation,
              label: "飞吻特效",
              gradientColors: [Colors.orangeAccent, Colors.orange]),
          const SizedBox(height: 16,),
          GradientElevatedButton(
              callback: _showLipstickAnimation,
              label: "口红特效",
              gradientColors: [Colors.greenAccent, Colors.lightGreenAccent]),
          const SizedBox(height: 16,),
          GradientElevatedButton(
              callback: _showLollipopAnimation,
              label: "棒棒糖特效",
              gradientColors: [Colors.tealAccent, Colors.teal]),
          const SizedBox(height: 16,),
          GradientElevatedButton(
              callback: _showSportsCarAnimation,
              label: "跑车特效",
              gradientColors: [Colors.orangeAccent, Colors.orange]),
        ],
      ),
    );
  }

  void _showAircraftAnimation() {
    _showAnim("files/svga/aircraft.svga");
  }

  void _showCondomAnimation() {
    _showAnim("files/svga/condoms.svga");
  }

  void _showDiamondRingAnimation() {
    _showAnim("files/svga/diamond_ring.svga");
  }

  void _showFireWorksAnimation() {
    _showAnim("files/svga/fireworks.svga");
  }

  void _showKissAnimation() {
    _showAnim("files/svga/kiss.svga");
  }

  void _showLipstickAnimation() {
    _showAnim("files/svga/lipstick.svga");
  }

  void _showLollipopAnimation() {
    _showAnim("files/svga/lollipop.svga");
  }

  void _showSportsCarAnimation() {
    _showAnim("files/svga/sports_car.svga");
  }

  void _showAnim(String name) {
    DialogUtil.showAppDialog(
      context: context,
      name: "showSvgaAnim",
      builder: (context) {
        return WillPopScope(
            child: WidgetSvgaPlayer(assetName: name,),
            onWillPop: () => Future.value(true)
        );
      });
  }
}
