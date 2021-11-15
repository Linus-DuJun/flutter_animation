import 'package:flutter/material.dart';
import 'package:linus_fortune_wheel/configs/resources/app_res.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: double.infinity,
          height: UiUtils.getRealWidthByDesign(220),
          child: Stack(
            alignment: Alignment.center,
            children: [
              WidgetFlare(
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
              ),
              Positioned(
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
              )
            ],
          ),
        )
      ),
    );
  }
}
