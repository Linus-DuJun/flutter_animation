import 'package:flutter/material.dart';

///button
class WidgetButton extends StatefulWidget {
  final String? iconText;
  final iconData;
  final leftIconData;
  final TextStyle textStyle;
  final double iconPadding;
  final double leftIconPadding;
  final VoidCallback? onPressed;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final double textWidth;
  final bool textExpanded;
  final TextAlign textAlign;
  final EdgeInsetsGeometry? padding;
  final ShapeBorder? shape;
  final Color color;
  final Color? colorAlpha;
  final double height;
  final bool row;
  final bool right;
  final bool disabledBg;
  final int maxLines;

  WidgetButton(
      {Key? key,
        required this.iconText,
        required this.textStyle,
        required this.iconData,
        this.leftIconData,
        this.iconPadding = 0,
        this.leftIconPadding = 0,
        this.onPressed,
        this.textWidth = -1,
        this.mainAxisAlignment = MainAxisAlignment.center,
        this.mainAxisSize = MainAxisSize.max,
        this.crossAxisAlignment = CrossAxisAlignment.center,
        this.padding,
        this.shape,
        required this.color,
        this.colorAlpha,
        this.height = 0,
        this.right = false,
        this.row = true,
        this.disabledBg = false,
        this.textAlign = TextAlign.start,
        this.textExpanded = false,
        this.maxLines = 1})
      : super(key: key);

  @override
  WidgetButtonState createState() => WidgetButtonState();
}

class WidgetButtonState extends State<WidgetButton> {
  String? iconText;

  @override
  void initState() {
    super.initState();
    iconText = widget.iconText;
  }

  void onSetState(String text) {
    this.iconText = text;
    setState(() {});
  }

  @override
  void didUpdateWidget(WidgetButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (iconText != widget.iconText) iconText = widget.iconText;
  }

  @override
  Widget build(BuildContext context) {
    Widget showText = (widget.textWidth == -1)
        ? Container(
        child: Text(iconText ?? '',
            style: widget.textStyle
                .merge(TextStyle(textBaseline: TextBaseline.alphabetic)),
            textAlign: widget.textAlign,
            overflow: TextOverflow.ellipsis,
            maxLines: widget.maxLines))
        : Container(
        width: widget.textWidth,
        child:

        ///显示数量文本
        Text(iconText ?? '',
            style: widget.textStyle.merge(
                TextStyle(textBaseline: TextBaseline.alphabetic)),
            textAlign: widget.textAlign,
            overflow: TextOverflow.ellipsis,
            maxLines: widget.maxLines));
    Color btnColor = widget.color;
    Color btnColorAlpha = widget.colorAlpha ??
        (widget.disabledBg ? Colors.transparent : btnColor.withAlpha(150));
    Color btnSplashColor = btnColor.withAlpha(50);
    if (widget.height == 0) {
      if (widget.iconData == null) {
        return TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.disabled)) {
                  return btnColorAlpha;
                } else {
                  return btnColor;
                }
              }),
              overlayColor: MaterialStateProperty.all(btnSplashColor),
              shape: MaterialStateProperty.all(widget.shape as OutlinedBorder?),
              padding: MaterialStateProperty.all(widget.padding),
            ),
            child: Row(
              textBaseline: TextBaseline.alphabetic,
              mainAxisAlignment: widget.mainAxisAlignment,
              mainAxisSize: widget.mainAxisSize,
              crossAxisAlignment: widget.crossAxisAlignment,
              children: <Widget>[
                widget.textExpanded ? Expanded(child: showText) : showText
              ],
            ),
            onPressed: widget.onPressed);
      } else {
        return TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.disabled)) {
                  return btnColorAlpha;
                } else {
                  return btnColor;
                }
              }),
              overlayColor: MaterialStateProperty.all(btnSplashColor),
              shape: MaterialStateProperty.all(widget.shape as OutlinedBorder?),
              padding: MaterialStateProperty.all(widget.padding),
            ),
            child: widget.row
                ? Row(
              textBaseline: TextBaseline.alphabetic,
              mainAxisAlignment: widget.mainAxisAlignment,
              mainAxisSize: widget.mainAxisSize,
              crossAxisAlignment: widget.crossAxisAlignment,
              children: (widget.right
                  ? <Widget>[
                widget.leftIconData != null
                    ? widget.leftIconData
                    : Container(),
                Padding(
                    padding:
                    EdgeInsets.all(widget.leftIconPadding)),
                widget.textExpanded
                    ? Expanded(child: showText)
                    : showText,
                Padding(
                    padding: EdgeInsets.all(widget.iconPadding)),
                widget.iconData
              ]
                  : <Widget>[
                widget.iconData,
                Padding(
                    padding: EdgeInsets.all(widget.iconPadding)),
                widget.textExpanded
                    ? Expanded(child: showText)
                    : showText
              ]),
            )
                : Column(
              textBaseline: TextBaseline.alphabetic,
              mainAxisAlignment: widget.mainAxisAlignment,
              mainAxisSize: widget.mainAxisSize,
              crossAxisAlignment: widget.crossAxisAlignment,
              children: (widget.right
                  ? <Widget>[
                widget.leftIconData != null
                    ? widget.leftIconData
                    : Container(),
                Padding(
                    padding:
                    EdgeInsets.all(widget.leftIconPadding)),
                widget.textExpanded
                    ? Expanded(child: showText)
                    : showText,
                Padding(
                    padding: EdgeInsets.all(widget.iconPadding)),
                widget.iconData
              ]
                  : <Widget>[
                widget.iconData,
                Padding(
                    padding: EdgeInsets.all(widget.iconPadding)),
                widget.textExpanded
                    ? Expanded(child: showText)
                    : showText
              ]),
            ),
            onPressed: widget.onPressed);
      }
    } else {
      if (widget.iconData == null) {
        return MaterialButton(
            elevation: 0,
            focusElevation: 0,
            disabledElevation: 0,
            highlightElevation: 0,
            hoverElevation: 0,
            color: btnColor,
            disabledColor: btnColorAlpha,
            splashColor: btnSplashColor,
            highlightColor: btnSplashColor,
            shape: widget.shape,
            padding: widget.padding,
            minWidth: 0,
            height: widget.height,
            child: Row(
              textBaseline: TextBaseline.alphabetic,
              mainAxisAlignment: widget.mainAxisAlignment,
              mainAxisSize: widget.mainAxisSize,
              crossAxisAlignment: widget.crossAxisAlignment,
              children: <Widget>[
                widget.textExpanded ? Expanded(child: showText) : showText
              ],
            ),
            onPressed: widget.onPressed);
      } else {
        return MaterialButton(
            elevation: 0,
            focusElevation: 0,
            disabledElevation: 0,
            highlightElevation: 0,
            hoverElevation: 0,
            color: btnColor,
            disabledColor: btnColorAlpha,
            splashColor: btnSplashColor,
            highlightColor: btnSplashColor,
            shape: widget.shape,
            padding: widget.padding,
            minWidth: 0,
            height: widget.height,
            child: widget.row
                ? Row(
              textBaseline: TextBaseline.alphabetic,
              mainAxisAlignment: widget.mainAxisAlignment,
              mainAxisSize: widget.mainAxisSize,
              crossAxisAlignment: widget.crossAxisAlignment,
              children: (widget.right
                  ? <Widget>[
                widget.leftIconData != null
                    ? widget.leftIconData
                    : Container(),
                Padding(
                    padding:
                    EdgeInsets.all(widget.leftIconPadding)),
                widget.textExpanded
                    ? Expanded(child: showText)
                    : showText,
                Padding(
                    padding: EdgeInsets.all(widget.iconPadding)),
                widget.iconData
              ]
                  : <Widget>[
                widget.iconData,
                Padding(
                    padding: EdgeInsets.all(widget.iconPadding)),
                widget.textExpanded
                    ? Expanded(child: showText)
                    : showText
              ]),
            )
                : Column(
              textBaseline: TextBaseline.alphabetic,
              mainAxisAlignment: widget.mainAxisAlignment,
              mainAxisSize: widget.mainAxisSize,
              crossAxisAlignment: widget.crossAxisAlignment,
              children: (widget.right
                  ? <Widget>[
                widget.leftIconData != null
                    ? widget.leftIconData
                    : Container(),
                Padding(
                    padding:
                    EdgeInsets.all(widget.leftIconPadding)),
                widget.textExpanded
                    ? Expanded(child: showText)
                    : showText,
                Padding(
                    padding: EdgeInsets.all(widget.iconPadding)),
                widget.iconData
              ]
                  : <Widget>[
                widget.iconData,
                Padding(
                    padding: EdgeInsets.all(widget.iconPadding)),
                widget.textExpanded
                    ? Expanded(child: showText)
                    : showText
              ]),
            ),
            onPressed: widget.onPressed);
      }
    }
  }
}
