import 'package:flutter/material.dart';
import 'package:svgaplayer_flutter/parser.dart';
import 'package:svgaplayer_flutter/player.dart';
import 'package:svgaplayer_flutter/proto/svga.pb.dart';

class WidgetSvgaPlayer extends StatefulWidget {
  final String assetName;
  const WidgetSvgaPlayer({
    required this.assetName,
    Key? key}
  ) : super(key: key);

  @override
  _WidgetSvgaPlayerState createState() => _WidgetSvgaPlayerState();
}

class _WidgetSvgaPlayerState extends State<WidgetSvgaPlayer>
  with SingleTickerProviderStateMixin {

  late SVGAAnimationController _controller;

  @override
  void initState() {
    _controller = SVGAAnimationController(vsync: this);
    Future<MovieEntity> decode = SVGAParser.shared.decodeFromAssets(widget.assetName);
    decode.then((movie) {
      if (mounted) {
        _controller
          ..videoItem = movie
          ..forward().whenComplete(() {
            if (!mounted) return;
            this._controller.clear();
            this._controller.videoItem = null;
            Navigator.pop(context);
          });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SVGAImage(_controller, fit: BoxFit.cover,);
  }

  @override
  void dispose() {
    _controller.videoItem = null;
    _controller.dispose();
    super.dispose();
  }
}
