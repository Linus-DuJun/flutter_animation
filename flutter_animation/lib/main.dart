import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linus_fortune_wheel/animations/implicit_animations/page_implicit_anim_index.dart';
import 'package:linus_fortune_wheel/code_img_fortune_wheel/page_code_img_fortune_wheel.dart';
import 'package:linus_fortune_wheel/page_anim_fortune_wheel.dart';
import 'package:linus_fortune_wheel/page_code_fortune_wheel.dart';
import 'package:linus_fortune_wheel/page_flare_animations.dart';
import 'package:linus_fortune_wheel/page_lottie_animation.dart';
import 'package:linus_fortune_wheel/page_svga_animations.dart';
import 'package:linus_fortune_wheel/page_test_snippet.dart';
import 'package:linus_fortune_wheel/utils/ui_util.dart';
import 'package:linus_fortune_wheel/widget/gradient_elevated_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => MaterialApp(
        title: 'Flutter Fortune Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 32,),
          GradientElevatedButton(
              callback: _goToImplicitAnimIndexPage,
              label: "Implicit Animation",
              labelStyle: _getButtonTextStyle(),
              gradientColors: [Colors.tealAccent, Colors.teal]),
          const SizedBox(height: 16,),
          GradientElevatedButton(
              callback: _goToCodeAndImageFortuneWheel,
              label: "Code&Image Fortune Wheel",
              labelStyle: _getButtonTextStyle(),
              gradientColors: [Colors.amberAccent, Colors.tealAccent]),
          const SizedBox(height: 16,),
          GradientElevatedButton(
              callback: _goToCodeWheelPage,
              label: "Code Fortune Wheel",
              labelStyle: _getButtonTextStyle(),
              gradientColors: [Colors.tealAccent, Colors.teal]),
          const SizedBox(height: 16,),
          GradientElevatedButton(
              callback: _goToAnimWheelPage,
              label: "Anim Fortune Wheel",
              labelStyle: _getButtonTextStyle(),
              gradientColors: [Colors.orangeAccent, Colors.orange]),
          const SizedBox(height: 16,),
          GradientElevatedButton(
              callback: _goToSvgaAnimationPage,
              label: "SVGA animations",
              labelStyle: _getButtonTextStyle(),
              gradientColors: [Colors.greenAccent, Colors.lightGreenAccent]),
          const SizedBox(height: 16,),
          GradientElevatedButton(
              callback: _goToFlareAnimations,
              label: "Flare animations",
              labelStyle: _getButtonTextStyle(),
              gradientColors: [Colors.greenAccent, Colors.lightGreenAccent]),
          UiUtils.getVerticalSizedBox(16),
          GradientElevatedButton(
              callback: _goToLottieAnimations,
              label: "Lottie animations",
              labelStyle: _getButtonTextStyle(),
              gradientColors: [Colors.greenAccent, Colors.lightGreenAccent]),
          UiUtils.getVerticalSizedBox(16),
          GradientElevatedButton(
              callback: _goToTestPage,
              label: "Test",
              labelStyle: _getButtonTextStyle(),
              gradientColors: [Colors.amberAccent, Colors.tealAccent]),
        ],
      ),
    );
  }

  void _goToImplicitAnimIndexPage() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => PageImplicitAnimIndex())
    );
  }

  void _goToLottieAnimations() {
     Navigator.of(context).push(
       MaterialPageRoute(builder: (_) => PageLottieAnimation())
     );
  }

  void _goToFlareAnimations() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => PageFlareAnimations())
    );
  }

  void _goToCodeAndImageFortuneWheel() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => PageCodeImgFortuneWheel())
    );
  }

  void _goToTestPage() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => PageTestSnippet())
    );
  }

  void _goToCodeWheelPage() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => PageCodeFortuneWheel())
    );
  }

  void _goToAnimWheelPage() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => PageAnimFortuneWheel())
    );
  }

  void _goToSvgaAnimationPage() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => PageSvgaAnimations())
    );
  }

  TextStyle _getButtonTextStyle() {
    return TextStyle(color: Colors.white);
  }
}


