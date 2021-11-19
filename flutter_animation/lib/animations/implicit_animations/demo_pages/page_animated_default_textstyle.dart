import 'package:flutter/material.dart';

class PageAnimatedDefaultTextStyle extends StatefulWidget {
  const PageAnimatedDefaultTextStyle({Key? key}) : super(key: key);

  @override
  _PageAnimatedDefaultTextStyleState createState() => _PageAnimatedDefaultTextStyleState();
}

class _PageAnimatedDefaultTextStyleState extends State<PageAnimatedDefaultTextStyle> {
  bool _smallText = true;
  double _fontSize = 35;
  Color _color = Colors.blue;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 200,
              alignment: Alignment.center,
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 500),
                style: TextStyle(
                  fontSize: _fontSize,
                  color: _color,
                  fontWeight: FontWeight.bold
                ),
                child: Text("AnimatedTextStyle"),
              ),
            ),
            SizedBox(height: 16,),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _fontSize = _smallText ? 35 : 20;
                  _color = _smallText ? Colors.blue : Colors.red;
                  _smallText = !_smallText;
                });
              },
              child: Text(
                "CLICK ME"
              ),
            )
          ],
        ),
      ),
    );
  }
}
