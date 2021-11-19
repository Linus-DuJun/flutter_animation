import 'package:flutter/material.dart';

class PageAnimatedAlign extends StatefulWidget {
  const PageAnimatedAlign({Key? key}) : super(key: key);

  @override
  _PageAnimatedAlignState createState() => _PageAnimatedAlignState();
}

class _PageAnimatedAlignState extends State<PageAnimatedAlign> {
  bool _selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          setState(() {
            _selected = !_selected;
          });
        },
        child: Center(
          child: Container(
            height: 200,
            width: 200,
            color: Colors.tealAccent,
            child: AnimatedAlign(
              alignment: _selected ? Alignment.bottomLeft : Alignment.topRight,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
              child: const FlutterLogo(size: 50,),
            ),
          ),
        ),
      ),
    );
  }
}
