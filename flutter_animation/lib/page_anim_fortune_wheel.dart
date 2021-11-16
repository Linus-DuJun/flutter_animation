import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:linus_fortune_wheel/configs/resources/app_res.dart';
import 'package:linus_fortune_wheel/configs/styles/app_text_styles.dart';
import 'package:linus_fortune_wheel/utils/click_util.dart';
import 'package:linus_fortune_wheel/utils/ui_util.dart';
import 'package:linus_fortune_wheel/utils/widget_util.dart';
import 'package:linus_fortune_wheel/widget/widget_button.dart';
import 'package:linus_fortune_wheel/widget/widget_button_spin.dart';
import 'package:linus_fortune_wheel/widget/widget_flare.dart';

class PageAnimFortuneWheel extends StatefulWidget {
  const PageAnimFortuneWheel({Key? key}) : super(key: key);

  @override
  _PageAnimFortuneWheelState createState() => _PageAnimFortuneWheelState();
}

class _PageAnimFortuneWheelState extends State<PageAnimFortuneWheel> {

  static const ANIM_NAME_SLOW_RUN = "slowRun";
  static const ANIM_NAME_FAST_RUN = "fastRun";
  static const ANIM_NAME_SLOW_CUT = "slowCut";
  static const ANIM_NAME_FAST_CUT = "fastCut";
  static const ANIM_NAME_SLOW_FLASH = "slowFlash";
  static const ANIM_NAME_FAST_FLASH = "fastFlash";
  static const ANIM_ITEM_STATUS_START = "start";
  static const ANIM_ITEM_STATUS_ING = "ing";
  static const ANIM_ITEM_STATUS_END = "end";

  GlobalKey<WidgetFlareState> flareGameKey = GlobalKey();
  GlobalKey<WidgetFlareState> flareItemKey1 = GlobalKey();
  GlobalKey<WidgetFlareState> flareItemKey2 = GlobalKey();
  GlobalKey<WidgetFlareState> flareItemKey3 = GlobalKey();
  GlobalKey<WidgetButtonSpinState> spinKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          _getBackgroundImage(),
          _getMainContentView(),
          _getAppBarView(),
          //Positioned()
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
        Column(
          children: [
            _getSettingsBackgroundView(),
            Expanded(child: _getFlaresView(),),
            SizedBox(height: 300,)
          ],
        ),

        //VISIBILEWIDGET
        _getPlayButtonView(),
      ],
    );
  }


  Center _getFlaresView() {
    return Center(
        child: SizedBox(
          width: double.infinity,
          height: UiUtils.getRealWidthByDesign(220),
          child: Stack(
            alignment: Alignment.center,
            children: [
              _getFlareMainBg(),
              _getLeftFlareItem(),
              _getCenterFlareItem(),
              _getRightFlareItem(),
            ],
          ),
        )
    );
  }

  WidgetFlare _getFlareMainBg() {
    return  WidgetFlare(
      key: flareGameKey,
      fileName: AppRes.FLARE_LUCK_GAME_BG,
      animName: ANIM_NAME_SLOW_RUN,
      callback: (String name) {
        if (name == ANIM_NAME_SLOW_RUN) {
          flareGameKey.currentState?.setAnimName(ANIM_NAME_SLOW_FLASH);
        } else if (name == ANIM_NAME_SLOW_FLASH) {
          flareGameKey.currentState?.setAnimName(ANIM_NAME_SLOW_CUT);
        } else if (name == ANIM_NAME_FAST_FLASH) {
          flareGameKey.currentState?.setAnimName(ANIM_NAME_FAST_CUT);
        }
      },
    );
  }

  Positioned _getLeftFlareItem() {
    return Positioned(
      top: UiUtils.getRealWidthByDesign(30),
      left: UiUtils.getRealWidthByDesign(60),
      width: UiUtils.getRealWidthByDesign(75),
      height: UiUtils.getRealWidthByDesign(150),
      child: WidgetFlare(
        key: flareItemKey1,
        fileName: AppRes.FLARE_LUCK_GAME_ITEM,
        animName: ANIM_ITEM_STATUS_START,
        isPaused: true,
        callback: (String name) {
          if (name == ANIM_ITEM_STATUS_START) {
            flareItemKey1.currentState?.setAnimName(ANIM_ITEM_STATUS_ING);
          }
        },
      ),
    );
  }

  Positioned _getCenterFlareItem() {
    return Positioned(
      top: UiUtils.getRealWidthByDesign(30),
      width: UiUtils.getRealWidthByDesign(75),
      height: UiUtils.getRealWidthByDesign(150),
      child: WidgetFlare(
        key: flareItemKey2,
        fileName: AppRes.FLARE_LUCK_GAME_ITEM,
        animName: ANIM_ITEM_STATUS_START,
        isPaused: true,
        callback: (String name) {
          if (name == ANIM_ITEM_STATUS_START) {
            flareItemKey2.currentState?.setAnimName(ANIM_ITEM_STATUS_ING);
          }
        },
      ),
    );
  }

  Positioned _getRightFlareItem() {
    return Positioned(
      top: UiUtils.getRealWidthByDesign(30),
      right: UiUtils.getRealWidthByDesign(60),
      width: UiUtils.getRealWidthByDesign(75),
      height: UiUtils.getRealWidthByDesign(150),
      child: WidgetFlare(
        key: flareItemKey3,
        fileName: AppRes.FLARE_LUCK_GAME_ITEM,
        animName: ANIM_ITEM_STATUS_START,
        isPaused: true,
        callback: (String name) {
          if (name == ANIM_ITEM_STATUS_START) {
            flareItemKey3.currentState?.setAnimName(ANIM_ITEM_STATUS_ING);
          }
        },
      ),
    );
  }

  Stack _getSettingsBackgroundView() {
    return Stack(
      children: [
        Stack(
          children: [
            _getBgLightView(),
            _getSettingsMainBgView(),
          ],
        ),
      ],
    );
  }

  Padding _getBgLightView() {
    return Padding(
      padding: EdgeInsets.only(
        top: UiUtils.statusBarHeight + UiUtils.getRealWidthByDesign(8),
      ),
      child: Image.asset(AppRes.IC_LUCKY_BG_LIGHT,
        fit: BoxFit.fitWidth,
        width: UiUtils.screenWidth,
        height: UiUtils.getRealWidthByDesign(210),
      ),
    );
  }

  Positioned _getSettingsMainBgView() {
    return Positioned(
      left: 0,
      right: 0,
      top: UiUtils.statusBarHeight + UiUtils.getRealWidthByDesign(8),
      child: Image.asset(AppRes.IC_LUCKY_SETTINGS_MAIN_BG,
        width: UiUtils.screenWidth,
        height: UiUtils.getRealWidthByDesign(170),
      ),
    );
  }

  Positioned _getPlayButtonView() {
    return Positioned(
      bottom: UiUtils.getRealWidthByDesign(20) + UiUtils.bottomBarHeight,
      child: WidgetButtonSpin(
        key: spinKey,
        showClick: (value) {
          // showKey.currentState?.onSetState(value);
        },
        onTap: (value) async {
          if (value) {
            Fluttertoast.showToast(msg: "TODO check condition to play");
            // checkSpinCoins(size: 0);
          } else {
            Fluttertoast.showToast(msg: "TODO, stop play");
            // stopSpinButton();
          }
        },
      ),
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
