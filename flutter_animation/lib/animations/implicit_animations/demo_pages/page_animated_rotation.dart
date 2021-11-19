import 'package:flutter/material.dart';

class PageAnimatedRotation extends StatefulWidget {
  const PageAnimatedRotation({Key? key}) : super(key: key);

  @override
  _PageAnimatedRotationState createState() => _PageAnimatedRotationState();
}

class _PageAnimatedRotationState extends State<PageAnimatedRotation> {

  double _rotation = 0.0;

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
                    _rotation += 1.0 / 4.0;
                  });
                },
                child: const Text("Rotation LOGO")) ,
            Padding(
              padding: const EdgeInsets.all(50),
              child: AnimatedRotation(
                turns: _rotation,
                duration: const Duration(milliseconds: 500),
                child: const FlutterLogo(size: 100,),
              )
            )
          ],
        ),
      ),
    );
  }
}
