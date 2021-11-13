import 'package:flutter/material.dart';

class DialogUtil {
  static Future<T?> showAppDialog<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    bool dismiss = true,
    Color color = Colors.black54,
    String? name}) {
    FocusScope.of(context).unfocus();
    return showDialog<T>(
      context: context,
      barrierColor: color,
      routeSettings: RouteSettings(name: name ?? "showAppDialog"),
      builder: (context) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            if (dismiss) Navigator.pop(context);
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: builder(context),
            ),
          ),
        );
      }
    );
  }
}