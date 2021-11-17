import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PageLottieAnimDetails extends StatelessWidget {
  final String animName;
  const PageLottieAnimDetails({
    required this.animName,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Lottie.asset(animName),
      ),
    );
  }
}
