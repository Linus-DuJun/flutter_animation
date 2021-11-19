import 'package:flutter/material.dart';

class PageTweenAnimationBuilder extends StatefulWidget {
  const PageTweenAnimationBuilder({Key? key}) : super(key: key);

  @override
  _PageTweenAnimationBuilderState createState() => _PageTweenAnimationBuilderState();
}

class _PageTweenAnimationBuilderState extends State<PageTweenAnimationBuilder> {
  double _target = 300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 150, end: _target),
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInToLinear,
          builder: (_, double value, child) {
            return Container(
              width: value,
              height: value,
              color: Colors.yellow,
              alignment: Alignment.center,
              child: child,
            );
          },
          child: Container(
            width: 100,
            height: 100,
            color: Colors.tealAccent,
          ),
          onEnd: () {
            setState(() {
              _target =  _target == 300 ? 200 : 300;
            });
          },
        ),
      ),
    );
  }
}
