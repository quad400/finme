import 'dart:ui';

import 'package:flutter/material.dart';

class AppDimensions {
  AppDimensions._();

  // Margin
  static const double sideSpacing = 14;

  // Padding
  static const double paddingXs = 8.0;
  static const double paddingSm = 10.0;
  static const double padding = 14.0;
  static const double paddingMd = 16.0;
  static const double paddinglg = 20.0;
  static const double paddingXl = 28.0;
  static const double paddingXxl = 34.0;
  static const double paddingXxxl = 36.0;

  // Radius
  static final radiusSm = BorderRadius.circular(4);
  static final radius = BorderRadius.circular(8);
  static final radiusMd = BorderRadius.circular(12);
  static final radiusLg = BorderRadius.circular(16);
  static final radiusXl = BorderRadius.circular(24);

  // Fonts
  static const double fontSizeXs = 8.0;
  static const double fontSizeSm = 10.0;
  static const double fontSize = 14.0;
  static const double fontSizeMd = 16.0;
  static const double fontSizelg = 20.0;
  static const double fontSizeXl = 28.0;
  static const double fontSizeXxl = 34.0;
  static const double fontSizeXxxl = 36.0;

  // Icons
  static const double iconSm = 16;
  static const double icon = 20;
  static const double iconLg = 24;

  // Heights
  static const double buttonHeight = 52;

  static double get screenHeight =>
      PlatformDispatcher.instance.views.first.physicalSize.height /
      PlatformDispatcher.instance.views.first.devicePixelRatio;

  static double get screenWidth =>
      PlatformDispatcher.instance.views.first.physicalSize.width /
      PlatformDispatcher.instance.views.first.devicePixelRatio;
}
