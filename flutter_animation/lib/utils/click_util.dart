import 'dart:ui';

/// 防止多次点击
class ClickUtil {
  static int _clicks = 0;
  static int _jumpTime = 0;
  static Function? _downFn;

  /// 防止多次点击
  static VoidCallback debounce(Function callback, [int t = 500]) {
    return () {
      if (_downFn != callback) {
        _clicks = 0;
        _downFn = callback;
        _jumpTime = 0;
      }
      if (_jumpTime >= (DateTime.now().millisecondsSinceEpoch - t)
          && _clicks <= 10) {
        _clicks++;
        _jumpTime = DateTime.now().millisecondsSinceEpoch;
        print("屏蔽快速点击");
      } else {
        _jumpTime = DateTime.now().millisecondsSinceEpoch;
        _clicks = 0;
        callback();
      }
    };
  }
}