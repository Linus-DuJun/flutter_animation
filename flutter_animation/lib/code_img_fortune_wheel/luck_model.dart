import 'dart:ui';

class LuckModel {
  final String image;
  final Color color;

  LuckModel({
    required this.image,
    required this.color
  });

  String get asset => "assets/images/$image.png";
}