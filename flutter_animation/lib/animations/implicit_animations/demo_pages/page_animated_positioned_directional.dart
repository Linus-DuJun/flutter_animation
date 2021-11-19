import 'package:flutter/material.dart';

class PageAnimatedPositionedDirectional extends StatefulWidget {
  const PageAnimatedPositionedDirectional({Key? key}) : super(key: key);

  @override
  _PageAnimatedPositionedDirectionalState createState() => _PageAnimatedPositionedDirectionalState();
}

class _PageAnimatedPositionedDirectionalState extends State<PageAnimatedPositionedDirectional> {
  bool _selected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200,
          height: 300,
          color: Colors.yellow,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Stack(
              children: [
                AnimatedPositionedDirectional(
                  width: _selected ? 150 : 100,
                  height: _selected ? 100 : 150,
                  end: _selected ? 0 : 50,
                  top: _selected ? 50 : 0,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selected = !_selected;
                      });
                    },
                    child: Container(
                      color: Colors.tealAccent,
                      child: Center(child: Text("RTL"),),
                    ),
                  ),
                  duration: const Duration(milliseconds: 500)
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
