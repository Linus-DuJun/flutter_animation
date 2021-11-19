import 'package:flutter/material.dart';

class PageAnimatedCrossFade extends StatefulWidget {
  const PageAnimatedCrossFade({Key? key}) : super(key: key);

  @override
  _PageAnimatedCrossFadeState createState() => _PageAnimatedCrossFadeState();
}

class _PageAnimatedCrossFadeState extends State<PageAnimatedCrossFade> {
  CrossFadeState _crossFadeState = CrossFadeState.showFirst;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _crossFadeState = CrossFadeState.showSecond;
      });
    });
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _crossFadeState = CrossFadeState.showFirst;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedCrossFade(
              crossFadeState: _crossFadeState,
              duration: const Duration(seconds: 2),
              reverseDuration: const Duration(seconds: 3),
              firstCurve: Curves.bounceInOut,
              secondCurve: Curves.easeInBack,
              firstChild: const Icon(Icons.text_rotate_up, size: 100,),
              secondChild: const Icon(Icons.text_rotate_vertical, size: 100,),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _crossFadeState = _crossFadeState == CrossFadeState.showFirst
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst;
                });
              },
              child: Text("CROSS FADE"),
            )
          ],
        )
      ),
    );
  }
}
