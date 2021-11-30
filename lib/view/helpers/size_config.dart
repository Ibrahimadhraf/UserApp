import 'package:flutter/widgets.dart';

/*
here handle all with and height according to MediaQuery api to make out app design response*/
class SizeConfig {
  SizeConfig._internal();

  static final SizeConfig _instance = SizeConfig._internal();

  factory SizeConfig() => _instance;

  MediaQueryData? _mediaQueryData;
  late double screenWidth;
  late double screenHeight;
  late double blockSizeHorizontal;
  late double blockSizeVertical;
  late double _safeAreaHorizontal;
  late double _safeAreaVertical;
  late double safeBlockHorizontal;
  late double safeBlockVertical;
  late double fontSize12;
  late double fontSize13;
  late double fontSize14;
  late double fontSize15;
  late double fontSize16;
  late double fontSize17;
  late double fontSize18;
  late double fontSize20;
  late double fontSize22;

  init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    _safeAreaHorizontal =
        _mediaQueryData!.padding.left + _mediaQueryData!.padding.right;
    _safeAreaVertical =
        _mediaQueryData!.padding.top + _mediaQueryData!.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
    fontSize12 = safeBlockHorizontal * 2.75;
    fontSize13 = safeBlockHorizontal * 3;
    fontSize14 = safeBlockHorizontal * 3.75;
    fontSize15 = safeBlockHorizontal * 4.5;
    fontSize16 = safeBlockHorizontal * 5;
    fontSize17 = safeBlockHorizontal * 6.5;
    fontSize18 = safeBlockHorizontal * 8;
    fontSize20 = safeBlockHorizontal * 10;
    fontSize22 = safeBlockHorizontal * 12;
  }
}
