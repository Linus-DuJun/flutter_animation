import 'package:flutter/material.dart';

class PageAnimatedPadding extends StatefulWidget {
  const PageAnimatedPadding({Key? key}) : super(key: key);

  @override
  _PageAnimatedPaddingState createState() => _PageAnimatedPaddingState();
}

class _PageAnimatedPaddingState extends State<PageAnimatedPadding> {
  double padValue = 0.0;
  void _updatePadding(double value) {
    setState(() {
      padValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedPadding(
            padding: EdgeInsets.all(padValue),
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOut,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 6,
              color: Colors.blue,
            ),
          ),
          Text('Padding: $padValue'),
          ElevatedButton(
              child: const Text('Change padding'),
              onPressed: () {
                _updatePadding(padValue == 0.0 ? 100.0 : 0.0);
              }),
        ],
      )
    );
  }
}
