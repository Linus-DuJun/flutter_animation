import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linus_fortune_wheel/configs/resources/app_res.dart';
import 'package:linus_fortune_wheel/configs/styles/app_text_styles.dart';
import 'package:linus_fortune_wheel/utils/click_util.dart';

class WidgetUtil {
  ///导航栏
  static Container getAppBarWidget({
    required BuildContext context,
    required String title,
    Widget? rightChild,
    bool top = false,
    Function? pop }) {
    return Container(
      height: kToolbarHeight,
      margin: EdgeInsets.only(
        top: top ? ScreenUtil().statusBarHeight : 0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            padding: EdgeInsets.all(0),
            icon: Image.asset(
              AppRes.IC_BACK,
              width: ScreenUtil().setWidth(40),
              height: ScreenUtil().setWidth(40),
            ),
            onPressed: ClickUtil.debounce(() {
              if (pop == null) {
                Navigator.pop(context);
              } else {
                pop();
              }
            }),
          ),
          Expanded(
            child: Text(title,
                style: AppTextStyles.pt20WhiteBold,
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
          ),
          rightChild ?? Container()
        ],
      ),
    );
  }
}