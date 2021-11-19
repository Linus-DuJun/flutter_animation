import 'package:flutter/material.dart';

class PageAnimatedOpacity extends StatefulWidget {
  const PageAnimatedOpacity({Key? key}) : super(key: key);

  @override
  _PageAnimatedOpacityState createState() => _PageAnimatedOpacityState();
}

class _PageAnimatedOpacityState extends State<PageAnimatedOpacity> {

  double _opacityLevel = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: _opacityLevel,
              curve: Curves.easeInToLinear,
              duration: const Duration(seconds: 2),
              child: const FlutterLogo(size: 100,),
            ),
            ElevatedButton(
              child: Text("FADE LOGO"),
              onPressed: () {
                setState(() {
                  _opacityLevel = _opacityLevel == 0 ? 1.0 : 0.0;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
