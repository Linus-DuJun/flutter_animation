import 'package:flutter/material.dart';

class PageTestSnippet extends StatefulWidget {
  const PageTestSnippet({Key? key}) : super(key: key);

  @override
  _PageTestSnippetState createState() => _PageTestSnippetState();
}

class _PageTestSnippetState extends State<PageTestSnippet>
  with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this
    );
    final curvedAnim = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticIn
    );
    _animation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(-1.5, 0.0)
    ).animate(curvedAnim);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      textDirection: TextDirection.ltr,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: FlutterLogo(size: 100,),
      ),
    );
  }
}
