import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class WidgetFlare extends StatefulWidget {
  final String fileName;
  final String animName;
  final bool isPaused;
  final FlareCompletedCallback? callback;

  const WidgetFlare({
    required Key key,
    required this.fileName,
    required this.animName,
    this.isPaused = false,
    this.callback
  }) : super(key: key);

  @override
  WidgetFlareState createState() => WidgetFlareState();
}

class WidgetFlareState extends State<WidgetFlare> {

  late String _fileName;
  late String _animName;
  late bool _isPaused;

  @override
  void initState() {
    super.initState();
    _fileName = widget.fileName;
    _animName = widget.animName;
    _isPaused = widget.isPaused;
  }

  void setAnimName(String name) {
    if (_isPaused) {
      _isPaused = false;
    }
    this._animName = name;
    if (mounted) {
      setState(() { });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlareActor(
      _fileName,
      animation: _animName,
      callback: widget.callback,
      isPaused: _isPaused,
    );
  }
}
