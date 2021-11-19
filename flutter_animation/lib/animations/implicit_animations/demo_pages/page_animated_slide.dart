import 'package:flutter/material.dart';

class PageAnimatedSlide extends StatefulWidget {
  const PageAnimatedSlide({Key? key}) : super(key: key);

  @override
  _PageAnimatedSlideState createState() => _PageAnimatedSlideState();
}

class _PageAnimatedSlideState extends State<PageAnimatedSlide> {
  Offset _offset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        setState(() {
                          _offset -= const Offset(0, 1);
                        });
                      });
                    },
                    child: const Text("UP")
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        setState(() {
                          _offset += const Offset(0, 1);
                        });
                      });
                    },
                    child: const Text("DOWN")
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        setState(() {
                          _offset -= const Offset(1, 0);
                        });
                      });
                    },
                    child: const Text("LEFT")
                ),
                // ElevatedButton(
                //     onPressed: () {
                //       setState(() {
                //         setState(() {
                //           _offset += const Offset(1, 0);
                //         });
                //       });
                //     },
                //     child: const Text("RIGHT")
                // ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        setState(() {
                          _offset += const Offset(1, 1);
                        });
                      });
                    },
                    child: const Text("RIGHT&DOWN")
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: AnimatedSlide(
                offset: _offset,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInToLinear,
                child: const FlutterLogo(size: 50,),
              ),
            )
          ],
        ),
      ),
    );
  }
}
