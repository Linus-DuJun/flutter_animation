import 'package:flutter/material.dart';
import 'package:linus_fortune_wheel/configs/resources/app_res.dart';
import 'package:linus_fortune_wheel/utils/ui_util.dart';

class WidgetButtonSpin extends StatefulWidget {
  final Function showClick;
  final Function onTap;
  const WidgetButtonSpin({
    required this.showClick,
    required this.onTap,
    Key? key}) : super(key: key);

  @override
  WidgetButtonSpinState createState() => WidgetButtonSpinState();
}

class WidgetButtonSpinState extends State<WidgetButtonSpin> {
  bool clickImage = false;
  bool enabledImage = true;
  bool stopImage = false;
  bool? longImage = false;
  int clickSize = 0;
  int clickTime = 0;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          _getButtonImage(),

        ],
      ),

    );
  }

  // Positioned _getButtonLabelView() {
  //   return Positioned(
  //     top: ,
  //   )
  // }

  Image _getButtonImage() {
    return Image.asset(
      !enabledImage
          ? AppRes.IC_LUCK_SPIN_UN
          : clickImage
            ? AppRes.IC_LUCK_SPIN_CLICK
            : AppRes.IC_LUCK_SPIN,
      width: UiUtils.getRealWidthByDesign(270),
      height: UiUtils.getRealWidthByDesign(56),
    );
  }
}
