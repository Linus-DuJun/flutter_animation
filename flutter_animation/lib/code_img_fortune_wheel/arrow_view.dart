import 'dart:math';
import 'package:flutter/material.dart';

class ArrowView extends StatelessWidget {
  const ArrowView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Transform.rotate(
        angle: pi,
        child: Padding(
          padding: EdgeInsets.only(top: 80),
          child: ClipPath(
            clipper: _ArrowClipper(),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black12, Colors.black]
                )
              ),
              height: 40,
              width: 40,
            ),
          ),
        ),
      ),
    );
  }
}


class _ArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Offset _center = size.center(Offset.zero);
    Path _path = Path()
        ..lineTo(_center.dx, size.height)
        ..lineTo(size.width, 0)
        ..lineTo(_center.dx, _center.dy)
        ..close();
    return _path;
  }

  @override
  bool shouldReclip(_ArrowClipper oldClipper) {
   return false;
  }

}