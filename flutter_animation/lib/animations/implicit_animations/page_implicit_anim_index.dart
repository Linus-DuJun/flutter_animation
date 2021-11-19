import 'package:flutter/material.dart';
import 'package:linus_fortune_wheel/animations/implicit_animations/demo_pages/page_animated_align.dart';
import 'package:linus_fortune_wheel/animations/implicit_animations/demo_pages/page_animated_container.dart';
import 'package:linus_fortune_wheel/animations/implicit_animations/demo_pages/page_animated_cross_fade.dart';
import 'package:linus_fortune_wheel/animations/implicit_animations/demo_pages/page_animated_default_textstyle.dart';
import 'package:linus_fortune_wheel/animations/implicit_animations/demo_pages/page_animated_opacity.dart';
import 'package:linus_fortune_wheel/animations/implicit_animations/demo_pages/page_animated_padding.dart';
import 'package:linus_fortune_wheel/animations/implicit_animations/demo_pages/page_animated_physical_model.dart';
import 'package:linus_fortune_wheel/animations/implicit_animations/demo_pages/page_animated_positioned.dart';
import 'package:linus_fortune_wheel/animations/implicit_animations/demo_pages/page_animated_positioned_directional.dart';
import 'package:linus_fortune_wheel/animations/implicit_animations/demo_pages/page_animated_rotation.dart';
import 'package:linus_fortune_wheel/animations/implicit_animations/demo_pages/page_animated_scale.dart';
import 'package:linus_fortune_wheel/animations/implicit_animations/demo_pages/page_animated_size.dart';
import 'package:linus_fortune_wheel/animations/implicit_animations/demo_pages/page_animated_slide.dart';
import 'package:linus_fortune_wheel/animations/implicit_animations/demo_pages/page_animated_switcher.dart';
import 'package:linus_fortune_wheel/animations/implicit_animations/demo_pages/page_animated_theme.dart';
import 'package:linus_fortune_wheel/animations/implicit_animations/demo_pages/page_tween_animation_builder.dart';
import 'package:linus_fortune_wheel/utils/ui_util.dart';
import 'package:linus_fortune_wheel/widget/gradient_elevated_button.dart';

class PageImplicitAnimIndex extends StatelessWidget {
  const PageImplicitAnimIndex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 32,),
          GradientElevatedButton(
              callback: () { _goToDemoPage(context, PageTweenAnimationBuilder()); },
              label: "TweenAnimationBuilder",
              labelStyle: _getButtonTextStyle(),
              gradientColors: [Colors.tealAccent, Colors.teal]),
          const SizedBox(height: 16,),
          GradientElevatedButton(
              callback: () {
                _goToDemoPage(context, PageAnimatedAlign());
              },
              label: "AnimatedAlign",
              labelStyle: _getButtonTextStyle(),
              gradientColors: [Colors.orangeAccent, Colors.orange]),
          const SizedBox(height: 16,),
          GradientElevatedButton(
              callback: () {
                _goToDemoPage(context, PageAnimatedContainer());
              },
              label: "AnimatedContainer",
              labelStyle: _getButtonTextStyle(),
              gradientColors: [Colors.greenAccent, Colors.lightGreenAccent]),
          const SizedBox(height: 16,),
          GradientElevatedButton(
              callback: () {
                _goToDemoPage(context, PageAnimatedDefaultTextStyle());
              },
              label: "AnimatedDefaultTextStyle",
              labelStyle: _getButtonTextStyle(),
              gradientColors: [Colors.greenAccent, Colors.lightGreenAccent]),
          UiUtils.getVerticalSizedBox(16),
          GradientElevatedButton(
              callback: () {
                _goToDemoPage(context, PageAnimatedScale());
              },
              label: "AnimatedScale",
              labelStyle: _getButtonTextStyle(),
              gradientColors: [Colors.greenAccent, Colors.lightGreenAccent]),
          UiUtils.getVerticalSizedBox(16),
          GradientElevatedButton(
              callback: () {
                _goToDemoPage(context, PageAnimatedRotation());
              },
              label: "AnimatedRotation",
              labelStyle: _getButtonTextStyle(),
              gradientColors: [Colors.amberAccent, Colors.tealAccent]),
          const SizedBox(height: 16,),
          GradientElevatedButton(
              callback: () {
                _goToDemoPage(context, PageAnimatedSlide());
              },
              label: "AnimatedSlide",
              labelStyle: _getButtonTextStyle(),
              gradientColors: [Colors.orangeAccent, Colors.orange]),
          const SizedBox(height: 16,),
          GradientElevatedButton(
              callback: () {
                _goToDemoPage(context, PageAnimatedOpacity());
              },
              label: "AnimatedOpacity",
              labelStyle: _getButtonTextStyle(),
              gradientColors: [Colors.greenAccent, Colors.lightGreenAccent]),
          const SizedBox(height: 16,),
          GradientElevatedButton(
              callback: () {
                _goToDemoPage(context, PageAnimatedPadding());
              },
              label: "AnimatedPadding",
              labelStyle: _getButtonTextStyle(),
              gradientColors: [Colors.greenAccent, Colors.lightGreenAccent]),
          UiUtils.getVerticalSizedBox(16),
          const SizedBox(height: 16,),
          GradientElevatedButton(
              callback: () {
                _goToDemoPage(context, PageAnimatedPhysicalModel());
              },
              label: "AnimatedPhysicalModel",
              labelStyle: _getButtonTextStyle(),
              gradientColors: [Colors.orangeAccent, Colors.orange]),
          const SizedBox(height: 16,),
          GradientElevatedButton(
              callback: () {
                _goToDemoPage(context, PageAnimatedPositioned());
              },
              label: "AnimatedPositioned",
              labelStyle: _getButtonTextStyle(),
              gradientColors: [Colors.greenAccent, Colors.lightGreenAccent]),
          const SizedBox(height: 16,),
          GradientElevatedButton(
              callback: () {
                _goToDemoPage(context, PageAnimatedPositionedDirectional());
              },
              label: "AnimatedPositionedDirectional",
              labelStyle: _getButtonTextStyle(),
              gradientColors: [Colors.greenAccent, Colors.lightGreenAccent]),
          UiUtils.getVerticalSizedBox(16),
          const SizedBox(height: 16,),
          GradientElevatedButton(
              callback: () {
                _goToDemoPage(context, PageAnimatedTheme());
              },
              label: "AnimatedTheme",
              labelStyle: _getButtonTextStyle(),
              gradientColors: [Colors.orangeAccent, Colors.orange]),
          const SizedBox(height: 16,),
          GradientElevatedButton(
              callback: () {
                _goToDemoPage(context, PageAnimatedCrossFade());
              },
              label: "AnimatedCrossFade",
              labelStyle: _getButtonTextStyle(),
              gradientColors: [Colors.greenAccent, Colors.lightGreenAccent]),
          const SizedBox(height: 16,),
          GradientElevatedButton(
              callback: () {
                _goToDemoPage(context, PageAnimatedSize());
              },
              label: "AnimatedSize",
              labelStyle: _getButtonTextStyle(),
              gradientColors: [Colors.greenAccent, Colors.lightGreenAccent]),
          UiUtils.getVerticalSizedBox(16),
          GradientElevatedButton(
              callback: () {
                _goToDemoPage(context, PageAnimatedSwitcher());
              },
              label: "AnimatedSwitcher",
              labelStyle: _getButtonTextStyle(),
              gradientColors: [Colors.greenAccent, Colors.lightGreenAccent]),
          SizedBox(height: 32,),
        ],
      ),
    );
  }

  void _goToDemoPage(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => widget)
    );
  }

  TextStyle _getButtonTextStyle() {
    return TextStyle(color: Colors.white);
  }
}
