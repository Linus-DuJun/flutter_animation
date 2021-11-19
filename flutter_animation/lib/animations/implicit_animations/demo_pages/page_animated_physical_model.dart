import 'package:flutter/material.dart';

class PageAnimatedPhysicalModel extends StatefulWidget {
  const PageAnimatedPhysicalModel({Key? key}) : super(key: key);

  @override
  _PageAnimatedPhysicalModelState createState() => _PageAnimatedPhysicalModelState();
}

class _PageAnimatedPhysicalModelState extends State<PageAnimatedPhysicalModel> {

  bool _elevated = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedPhysicalModel(
                child: Container(
                  width: 150,
                  height: 150,
                  child: FlutterLogo(size: 80,),
                ),
                shape: BoxShape.rectangle,
                elevation: _elevated ? 0 : 6.0,
                color: Colors.teal,
                shadowColor: Colors.red,
                duration: const Duration(seconds: 1)),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _elevated = !_elevated;
                });
              },
            child: Text("AnimatedPhysicalModel")
            )
          ],
        ),
      ),
    );
  }
}
