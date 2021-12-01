import 'dart:math' as Math;
import 'package:flutter/material.dart';
import 'package:linus_fortune_wheel/code_img_fortune_wheel/arrow_view.dart';
import 'package:linus_fortune_wheel/code_img_fortune_wheel/luck_model.dart';
import 'package:linus_fortune_wheel/configs/resources/app_res.dart';

class BoardView extends StatefulWidget {
  final double angle;
  final double current;
  final List<LuckModel> items;

  const BoardView({
    Key? key,
    required this.angle,
    required this.current,
    required this.items
  }) : super(key: key);

  @override
  _BoardViewState createState() => _BoardViewState();
}

class _BoardViewState extends State<BoardView> {
  Size get size => Size(MediaQuery.of(context).size.width - 32,
      MediaQuery.of(context).size.width - 32);

  double _rotate(int index) => (index / widget.items.length) * 2 * Math.pi;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Container(
        //   height: size.height,
        //   width: size.width,
        //   decoration: BoxDecoration(
        //     shape: BoxShape.circle,
        //     boxShadow: [
        //       BoxShadow(blurRadius: 20, color: Colors.black38)
        //     ]
        //   ),
        // ),
        Image.asset(AppRes.IMG_WHEEL_BG,
          width: size.width + 24,
          height: size.height + 24,
          fit: BoxFit.cover,
        ),
        Transform.rotate(
          angle: -(widget.current + widget.angle) * 2 * Math.pi,
          child: Stack(
            alignment: Alignment.center,
            children: [
              for(var luck in widget.items) ...[_buildCard(luck)],
              for(var luck in widget.items) ...[_buildImage(luck)]
            ],
          ),
        ),
      ],
    );
  }


  _buildCard(LuckModel luck) {
    var rotate = _rotate(widget.items.indexOf(luck));
    var angle = 2 * Math.pi / widget.items.length;
    return Transform.rotate(
      angle: rotate,
      child: ClipPath(
        clipper: _LuckPath(angle: angle),
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              stops: [0.2, 1],
              colors: [Color(0xFFE6B156), Color(0xFF6B4E2B),]
            )
          ),
        ),
      ),
    );
  }

  _buildImage(LuckModel luck) {
    final index = widget.items.indexOf(luck);
    var rotate = _rotate(widget.items.indexOf(luck));
    return Transform.rotate(
      angle: rotate,
      child: Container(
        height: size.height,
        width: size.width,
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(
            height: size.height / 3,
            width: 48
          ),
          child: Column(
            children: [
              SizedBox(height: 16,),
              Image.asset(luck.asset),
              SizedBox(height: 16,),
              Text("$index等奖")
            ],
          ),
        ),
      ),
    );
  }
}



class _LuckPath extends CustomClipper<Path> {
  final double angle;
  _LuckPath({required this.angle});

  @override
  Path getClip(Size size) {
    Offset _center = size.center(Offset.zero);
    Rect _rect = Rect.fromCircle(center: _center, radius: size.width / 2);
    Path _path = Path()
      ..moveTo(_center.dx, _center.dy)
      ..arcTo(_rect, -Math.pi / 2 - angle / 2, angle, false)
      ..close();
    return _path;
  }

  @override
  bool shouldReclip(_LuckPath oldClipper) {
    return angle != oldClipper.angle;
  }

}