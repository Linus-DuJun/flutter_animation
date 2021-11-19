import 'package:flutter/material.dart';

class PageAnimatedPositioned extends StatefulWidget {
  const PageAnimatedPositioned({Key? key}) : super(key: key);

  @override
  _PageAnimatedPositionedState createState() => _PageAnimatedPositionedState();
}

class _PageAnimatedPositionedState extends State<PageAnimatedPositioned> {
  bool _selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 350,
          width: 200,
          color: Colors.yellow,
          child: Stack(
            children: [
              AnimatedPositioned(
                width: _selected ? 200 : 50,
                height: _selected ? 50 : 200,
                top: _selected ? 50 : 150,
                duration: const Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selected = !_selected;
                    });
                  },
                  child: Container(
                    color: Colors.tealAccent,
                    child: Center(child: Text("ANIMATED POSITIONED"),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
