import 'dart:math' as Math;
import 'package:flutter/material.dart';
import 'package:linus_fortune_wheel/utils/ui_util.dart';

enum CircleSliceLayoutSlot {
  Slice,
  Child,
}

class CircleSliceLayoutDelegate extends MultiChildLayoutDelegate {
  final double angle;

  CircleSliceLayoutDelegate({required this.angle});

  @override
  void performLayout(Size size) {
    late Size sliceSize;
    Size childSize;
    if (hasChild(CircleSliceLayoutSlot.Slice)) {
      sliceSize = layoutChild(
          CircleSliceLayoutSlot.Slice,
          BoxConstraints.tight(size)
      );
      positionChild(CircleSliceLayoutSlot.Slice, Offset.zero);
    }

    if(hasChild(CircleSliceLayoutSlot.Child)) {
      childSize = layoutChild(
        CircleSliceLayoutSlot.Child,
        BoxConstraints.loose(size)
      );
      final topRectVector = Math.Point(sliceSize.width / 2, 0.0);
    }
  }

  @override
  bool shouldRelayout(CircleSliceLayoutDelegate oldDelegate) {
    return angle != oldDelegate.angle;
  }

}

class WidgetCircleSliceView extends StatelessWidget {
  const WidgetCircleSliceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomPaint(
          size: Size(UiUtils.screenWidth, UiUtils.screenHeight),
          painter: CircleSlicePainter(
              angle: Math.pi / 4,
              color: Colors.blue),
        ),
      ),
    );
  }
}


class CircleSlicePainter extends CustomPainter {
  final double angle;
  final Color color;
  const CircleSlicePainter({
    required this.angle,
    required this.color
  });

  @override
  void paint(Canvas canvas, Size size) {
    final radius = Math.min(size.width, size.height);
    final path = _CircleSlice.buildSlicePath(radius, angle);
    final paint = Paint()..color = color;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}

class _CircleSlice {
  static Path buildSlicePath(double radius, double angle) {
    return Path()
        ..moveTo(0, 0)
        ..lineTo(radius, 0)
        ..arcTo(
            Rect.fromCircle(center: Offset(0, 0), radius: radius),
            0,
            angle,
            false)
        ..close();
  }
}