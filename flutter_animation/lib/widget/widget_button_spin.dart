import 'package:flutter/material.dart';
import 'package:linus_fortune_wheel/configs/resources/app_res.dart';
import 'package:linus_fortune_wheel/configs/styles/app_text_styles.dart';
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

  void closeSizeView() {
    if (clickImage) {
      clickImage = false;
      longImage = false;
      if (!mounted) return;
      setState(() {});
    }
  }

  void setShowSize(int size, {bool stop = false}) {
    clickSize = size;
    clickImage = false;
    stopImage = stop;
    enabledImage = false;
    longImage = false;
    if (mounted) {
      setState(() { });
    }
  }

  void setStopImage(bool stop) {
    stopImage = stop;
    enabledImage = true;
    clickImage = false;
    if (!stop) {
      longImage = false;
      clickSize = 0;
    }
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          _getButtonImage(),
          _getButtonLabelView(),
          _getSimpleButtonLabelView(),
          // _getClickSizeLabelView(),
        ],
      ),
      onTapDown: (TapDownDetails details) {
        if (!enabledImage) return;
        clickImage = true;
        clickTime = DateTime.now().millisecondsSinceEpoch;
        setState(() {});
      },
      onTapUp: (TapUpDetails details) {
        if (!enabledImage) return;
        if (DateTime.now().millisecondsSinceEpoch - clickTime >= 200) {
          clickImage = false;
          setState(() { });
          if (stopImage) return;
          widget.showClick.call(clickImage);
        } else {
          Future.delayed(const Duration(milliseconds: 200), () {
            clickImage = false;
            setState(() { });
            if (stopImage) return;
            widget.showClick.call(clickImage);
          });
        }
      },
      onTapCancel: () {
        if (!enabledImage) return;
        if (DateTime.now().millisecondsSinceEpoch - clickTime >= 200) {
          clickImage = false;
          setState(() { });
          if (stopImage) return;
          widget.showClick.call(clickImage);
        } else {
          Future.delayed(const Duration(milliseconds: 200), () {
            clickImage = false;
            setState(() { });
            if (stopImage) return;
            widget.showClick.call(clickImage);
          });
        }
      },
      onLongPress: () {
        if (!enabledImage || stopImage) return;
        longImage = true;
        clickImage = true;
        clickTime = 0;
        setState(() {});
        widget.showClick.call(clickImage);
      },
      onTap: () {
        if (longImage == null || !enabledImage) return;
        if (longImage == true) {
          longImage = false;
          return;
        }
        longImage = null;
        if (stopImage) {
          widget.onTap.call(false);
        } else {
          enabledImage = false;
          setState(() { });
          widget.onTap.call(true);
        }
      },
    );
  }

  Visibility _getClickSizeLabelView() {
    return Visibility(
      visible: !stopImage || clickSize != 0,
      child: Positioned(
        bottom: clickImage
            ? UiUtils.getRealWidthByDesign(8)
            : UiUtils.getRealWidthByDesign(14),
        child: Text(
          clickSize != 0 ? "$clickSize" : "HOLD FOR AUTO",
          style: AppTextStyles.pt16WhiteBold.copyWith(
            fontSize: 10,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 2
              ..color = Color(0xFFFFEA73)
          ),
        ),
      ),
    );
  }

  Visibility _getClickSizeLabelSimpleView() {
    return Visibility(
      visible: !stopImage || clickSize != 0,
      child: Positioned(
        bottom: clickImage
            ? UiUtils.getRealWidthByDesign(8)
            : UiUtils.getRealWidthByDesign(14),
        child: Text(
          clickSize != 0 ? "$clickSize" : "HOLD FOR AUTO",
          style: AppTextStyles.pt16WhiteBold.copyWith(
              fontSize: 10,
          ),
        ),
      ),
    );
  }

  Positioned _getButtonLabelView() {
    return Positioned(
      top: stopImage && clickSize == 0
        ? UiUtils.getRealWidthByDesign(14)
        : UiUtils.getRealWidthByDesign(8),
      child: Text(
        clickSize == 0 && !stopImage ? "SPIN" : "STOP",
        style: AppTextStyles.pt16WhiteBold.copyWith(
          fontSize: 24,
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 4
            ..color = Color(0xFF8D3C13)
        ),
      ),
    );
  }

  Positioned _getSimpleButtonLabelView() {
    return Positioned(
      top: stopImage && clickSize == 0
          ? UiUtils.getRealWidthByDesign(14)
          : UiUtils.getRealWidthByDesign(8),
      child: Text(
        clickSize == 0 && !stopImage ? "SPIN" : "STOP",
        style: AppTextStyles.pt16WhiteBold.copyWith(
            fontSize: 24,
        ),
      ),
    );
  }

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
