import 'package:flutter/material.dart';
import 'package:linus_fortune_wheel/configs/resources/app_res.dart';
import 'package:linus_fortune_wheel/utils/media_util.dart';
import 'package:linus_fortune_wheel/utils/ui_util.dart';
import 'package:linus_fortune_wheel/widget/widget_flare.dart';

class PageFlareAnimations extends StatefulWidget {
  const PageFlareAnimations({Key? key}) : super(key: key);

  @override
  _PageFlareAnimationsState createState() => _PageFlareAnimationsState();
}

class _PageFlareAnimationsState extends State<PageFlareAnimations> {
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

  @override
  void initState() {
    super.initState();
    MediaUtil.instance.startPlayLuckyBgAudio();
  }

  @override
  void dispose() {
    MediaUtil.instance.stopPlayLuckyBg();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _getBackgroundImage(),
         _getFlaresView()
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
        isPaused: false,
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
        isPaused: false,
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
        isPaused: false,
        callback: (String name) {
          if (name == ANIM_ITEM_STATUS_START) {
            flareItemKey3.currentState?.setAnimName(ANIM_ITEM_STATUS_ING);
          }
        },
      ),
    );
  }
}
