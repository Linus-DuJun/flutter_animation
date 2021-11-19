import 'package:flutter/material.dart';
import 'package:linus_fortune_wheel/configs/resources/app_res.dart';

class PageAnimatedContainer extends StatefulWidget {
  const PageAnimatedContainer({Key? key}) : super(key: key);

  @override
  _PageAnimatedContainerState createState() => _PageAnimatedContainerState();
}

class _PageAnimatedContainerState extends State<PageAnimatedContainer> {
  bool _isBigger = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: _isBigger ? 300 : 100,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [Colors.purple, Colors.transparent],
                  stops: [_isBigger ? 0.2 : 0.5, 1.0]
                ),
              ),
              curve: Curves.fastOutSlowIn,
              child: Image.asset(AppRes.IMG_DEMO_USAGE, fit: BoxFit.cover,),
            ),
            Container(
              height: 56,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                            _isBigger = !_isBigger;
                        });
                      },
                      child: Text("ANIMATE")
                  )
                ],
              ),
            ),
            SizedBox(height: 16,)
          ],
        ),
      )
    );
  }
}
