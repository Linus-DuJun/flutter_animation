import 'package:flutter/material.dart';
import 'package:linus_fortune_wheel/utils/ui_util.dart';
import 'dart:math' as Math;
import 'package:linus_fortune_wheel/widget/widget_circle_slice_view.dart';

class PageCodeFortuneWheel extends StatefulWidget {
  const PageCodeFortuneWheel({Key? key}) : super(key: key);

  @override
  _PageCodeFortuneWheelState createState() => _PageCodeFortuneWheelState();
}

class _PageCodeFortuneWheelState extends State<PageCodeFortuneWheel> {
  static const colors = <Color>[
    Colors.tealAccent,
    Colors.orangeAccent,
    Colors.purpleAccent,
    Colors.pinkAccent,
    Colors.yellowAccent,
    Colors.cyan,
    Colors.greenAccent
  ];
  final anglePerSlice = 2 * Math.pi / colors.length;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Stack(
            // children: _getRotatedSliceView(),
            children: [
              CustomPaint(
                size: Size(UiUtils.screenWidth - 32, UiUtils.screenHeight-32),
                painter: CircleSlicePainter(
                  angle: 45,
                  color: Colors.tealAccent
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text("test"),
              )
            ],
          ),
        )
      )
    );
  }

  List<Widget> _getRotatedSliceView() {
    final views = <Widget>[];
    for(int i = 0; i < colors.length; i++) {
      views.add(Transform.rotate(
          angle: i * anglePerSlice,
          alignment: Alignment.topLeft,
          child: CustomPaint(
            size: Size(UiUtils.screenWidth - 32, UiUtils.screenHeight-32),
            painter: CircleSlicePainter(
                angle: anglePerSlice,
                color: colors[i]),
          ),
      ));
    }
    return views;
  }
}
