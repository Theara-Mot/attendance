import 'package:flutter/material.dart';

class AppDimension {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static double get screenWidth {
    final BuildContext? context = navigatorKey.currentState?.overlay?.context;
    return MediaQuery.of(context!).size.width;
  }

  static double get screenHeight {
    final BuildContext? context = navigatorKey.currentState?.overlay?.context;
    return MediaQuery.of(context!).size.height;
  }

  /// SCREEN HEIGHT
  static double height8 = screenHeight/116.5;
  static double height10 = screenHeight/93.2;
  static double height20 = screenHeight/46.6;


  /// SCREEN WIDTH
  static double width10 = screenWidth/screenWidth*10;
  static double width15 = screenWidth/28.66;


  /// FONT SIZE
  static double font10 = screenWidth/43.0;
  static double font20 = screenWidth/21.5;
  static double font16 = screenWidth/26.875;
  static double font15 = screenWidth/28.66;
  static double font8 = screenWidth/53.75;


  /// RADIUS
  static double radius10 = screenWidth/43.0;
  static double radius8 = screenWidth/53.75;



  /// MARGIN AND PADDING
  static double margin10 = screenWidth/43.0;
  static double margin8 = screenWidth/53.75;
}