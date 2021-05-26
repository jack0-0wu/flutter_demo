import 'dart:ui' as ui;

class SizeAdaptiveUtil {
  static SizeAdaptiveUtil _instance;
  factory SizeAdaptiveUtil() => _getInstance();
  static double _windowWidth;
  static double _designWidth;
  static double _designHeight;
  static double _widthPercentage;
  static double _scaling = 1.0;
  setScaling(double num) {
    _scaling = num;
  }

  SizeAdaptiveUtil._();
  static void init({double width = 750, double height = 1334}) {
    _windowWidth = ui.window.physicalSize.width / ui.window.devicePixelRatio;
    _designWidth = width;
    _designHeight = height;
    _widthPercentage = _windowWidth / _designWidth;
  }

  static SizeAdaptiveUtil _getInstance() {
    if (_instance == null) {
      _instance = SizeAdaptiveUtil._();
      SizeAdaptiveUtil.init();
      return _instance;
    }
    return _instance;
  }

  double size(num designSize) => designSize * _widthPercentage;
  double fontSize(num designFontSize) =>
      designFontSize * _widthPercentage * _scaling;
}
