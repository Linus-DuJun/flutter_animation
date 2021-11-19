import 'package:flutter/material.dart';

class PageAnimatedScale extends StatefulWidget {
  const PageAnimatedScale({Key? key}) : super(key: key);

  @override
  _PageAnimatedScaleState createState() => _PageAnimatedScaleState();
}

class _PageAnimatedScaleState extends State<PageAnimatedScale> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _scale = _scale == 1.0 ? 3.0 : 1.0;
                });
              },
              child: const Text("Scale LOGO")) ,
            Padding(
              padding: const EdgeInsets.all(50),
              child: AnimatedScale(
                scale: _scale,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInToLinear,
                child: const FlutterLogo(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
