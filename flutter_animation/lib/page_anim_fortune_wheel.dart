import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:linus_fortune_wheel/configs/resources/app_res.dart';
import 'package:linus_fortune_wheel/configs/styles/app_text_styles.dart';
import 'package:linus_fortune_wheel/utils/click_util.dart';
import 'package:linus_fortune_wheel/utils/ui_util.dart';
import 'package:linus_fortune_wheel/utils/widget_util.dart';
import 'package:linus_fortune_wheel/widget/widget_button.dart';

class PageAnimFortuneWheel extends StatefulWidget {
  const PageAnimFortuneWheel({Key? key}) : super(key: key);

  @override
  _PageAnimFortuneWheelState createState() => _PageAnimFortuneWheelState();
}

class _PageAnimFortuneWheelState extends State<PageAnimFortuneWheel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          _getBackgroundImage(),
          _getAppBarView(),
          _getMainContentView(),
        ],
      )
    );
  }

  Image _getBackgroundImage() {
    return Image.asset("assets/images/main_bg.jpg",
      fit: BoxFit.cover,
      width: UiUtils.screenWidth,
      height: UiUtils.screenHeight,
    );
  }

  Positioned _getBarrageView() {
    return Positioned(
      top: UiUtils.statusBarHeight + UiUtils.getRealWidthByDesign(5),
      left: 0,
      right: 0,
      height: UiUtils.getRealWidthByDesign(200),
      // child: Barrage(
      //   key: barrageKey,
      //   showCount: 2,
      //   padding: 15,
      // ),
      child: Container(),
    );
  }

  Container _getAppBarView() {
    return WidgetUtil.getAppBarWidget(
        context: context,
        title: " ",
      top: true,
      rightChild: WidgetButton(
          iconText: "Info",
          textStyle: AppTextStyles.pt16WhiteBold,
          iconData: _getLuckInfoIcon(),
          mainAxisAlignment: MainAxisAlignment.end,
          iconPadding: UiUtils.getRealWidthByDesign(2),
          color: Colors.transparent,
          onPressed: ClickUtil.debounce(() {
            _showRuleBottomSheet();
          }),
      ),
      pop: () {
          //TODO  Add logic for exit page
        Fluttertoast.showToast(msg: "TODO, 添加退出逻辑");
        Navigator.pop(context);
      }
    );
  }

  Image _getLuckInfoIcon() {
    return Image.asset(AppRes.IC_LUCK_INFO,
      width: UiUtils.getRealWidthByDesign(12),
      height: UiUtils.getRealHeightByDesign(12),
    );
  }

  Stack _getMainContentView() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        // Positioned(
        //   bottom: UiUtils.getRealWidthByDesign(20) + UiUtils.bottomBarHeight,
        //   child: ButtonSpinWidget(
        //     key: spinKey,
        //     showClick: (value) {
        //       showKey.currentState?.onSetState(value);
        //     },
        //     onTap: (value) async {
        //       if (value) {
        //         checkSpinCoins(size: 0);
        //       } else {
        //         stopSpinButton();
        //       }
        //     },
        //   ),
        // ),
      ],
    );
  }


  void _showRuleBottomSheet() async {
    Fluttertoast.showToast(msg: "TODO, show info bottom sheet");
    // FocusScope.of(context).unfocus();
    // showModalBottomSheet(
    //   context: context,
    //   backgroundColor: Colors.transparent,
    //   isScrollControlled: true,
    //   routeSettings: RouteSettings(name: 'showRuleBottomSheet'),
    //   builder: (BuildContext showContext) {
    //     return DraggableScrollableSheet(
    //       initialChildSize: 0.8,
    //       builder: (BuildContext context, ScrollController scrollController) {
    //         return StatefulBuilder(
    //           builder: (showContext, setBottomSheetState) {
    //             return Scaffold(
    //               resizeToAvoidBottomInset: false,
    //               backgroundColor: Colors.transparent,
    //               body: Stack(
    //                 alignment: Alignment.topRight,
    //                 children: <Widget>[
    //                   TabBarWidget(
    //                     type: TabBarWidget.TOP_TAB,
    //                     top: false,
    //                     isScrollable: true,
    //                     indicatorColor: Colors.white,
    //                     height: ScreenUtil().setWidth(20),
    //                     padding:
    //                     EdgeInsets.only(bottom: UiUtils.getRealWidthByDesign(20)),
    //                     decoration: ShapeDecoration(
    //                       gradient: LinearGradient(
    //                         begin: Alignment.topCenter,
    //                         end: Alignment.bottomCenter,
    //                         colors: [
    //                           ConstantColors.app_color,
    //                           ConstantColors.color_lucky_top
    //                         ],
    //                       ),
    //                       shape: RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.only(
    //                           topLeft:
    //                           Radius.circular(30),
    //                           topRight:
    //                           Radius.circular(30),
    //                         ),
    //                       ),
    //                     ),
    //                     tabItems: <Widget>[
    //                       CustomTabs.Tab(text: S.of(context).strMainLuckyRule),
    //                       CustomTabs.Tab(text: S.of(context).strMainLuckyRank)
    //                     ],
    //                     tabViews: [LuckyRulePage(), LuckyListPage(0)],
    //                     onPageChanged: (index) {
    //                       if (index == 0) {
    //                         FirebaseAnalytics()
    //                             .setCurrentScreen(screenName: 'LuckyRulePage');
    //                       } else {
    //                         FirebaseAnalytics()
    //                             .setCurrentScreen(screenName: 'LuckyListPage');
    //                       }
    //                     },
    //                   ),
    //                   Positioned(
    //                     top: ScreenUtil().setWidth(6),
    //                     right: ScreenUtil().setWidth(12),
    //                     child: IconButton(
    //                       padding: EdgeInsets.all(0),
    //                       icon: Image.asset(ConstantIcons.main_lucky_close,
    //                           width: ScreenUtil().setWidth(24),
    //                           height: ScreenUtil().setWidth(24)),
    //                       onPressed: NavigatorUtils.debounce(() {
    //                         Navigator.pop(context);
    //                       }),
    //                     ),
    //                   ),
    //                   Positioned(
    //                     top: kToolbarHeight,
    //                     left: 0,
    //                     right: 0,
    //                     child: Container(
    //                       height: ScreenUtil().setWidth(22),
    //                       decoration: ShapeDecoration(
    //                         color: ConstantColors.bg_pop_color,
    //                         shape: RoundedRectangleBorder(
    //                           borderRadius: BorderRadius.only(
    //                             topLeft:
    //                             Radius.circular(ScreenUtil().setWidth(20)),
    //                             topRight:
    //                             Radius.circular(ScreenUtil().setWidth(20)),
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             );
    //           },
    //         );
    //       },
    //     );
    //   },
    // );
  }
}
