import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UiUtils {

  static final _screenUtil = ScreenUtil();

  static double screenWidth = _screenUtil.screenWidth;
  static double screenHeight = _screenUtil.screenHeight;
  static double statusBarHeight = _screenUtil.statusBarHeight;
  static double bottomBarHeight = _screenUtil.bottomBarHeight;

  static Image getIconByPath(String path,
      {String? package, double? width, double? height, BoxFit? fit}) {
    return Image.asset(
      AssetImage(path).assetName,
      package: package,
      fit: fit ?? BoxFit.cover,
      width: width,
      height: height,
    );
  }

  // 根据设计图宽度计算出实际宽度
  static double getRealWidthByDesign(double designWidth) {
    return _screenUtil.setWidth(designWidth);
  }

  // 根据设计图高度计算出实际高度
  static double getRealHeightByDesign(double designHeight) {
    return _screenUtil.setHeight(designHeight);
  }

  static SizedBox getVerticalSizedBox(double height) {
    return SizedBox(height: height);
  }

  static SizedBox getHorizontalSizedBox(double width) {
    return SizedBox(width: width,);
  }

  ///获取颜色值
  static Color hexToColor(String s) {
    try {
      // 如果传入的十六进制颜色值不符合要求，返回默认值
      if (s == null || s.length != 7 ||
          int.tryParse(s.substring(1, 7), radix: 16) == null) {
        s = '#999999';
      }
      return Color(int.parse(s.substring(1, 7), radix: 16) + 0xFF000000);
    } catch (exc) {
      return Colors.transparent;
    }
  }
}