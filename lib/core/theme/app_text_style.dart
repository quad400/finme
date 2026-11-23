import 'package:finme/core/theme/app_color.dart';
import 'package:finme/core/theme/app_dimensions.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  AppTextStyle._();

  static const String fontFamily = "MonoSans";

  static final TextStyle displayLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.fontSizeXxxl,
    fontWeight: FontWeight.w700,
    color: AppColors.onSurface,
  );

  static final TextStyle displayMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.fontSizeXl,
    fontWeight: FontWeight.w600,
    color: AppColors.onSurface,
  );

  static final TextStyle displaySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.fontSizeMd,
    fontWeight: FontWeight.w600,
    color: AppColors.onSurface,
  );

  static final TextStyle bodyLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.fontSizeMd,
    fontWeight: FontWeight.w500,
    color: AppColors.onSurface,
  );
  static final TextStyle bodyMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.fontSizeMd,
    fontWeight: FontWeight.w400,
    color: AppColors.onSurface,
  );

  static final TextStyle bodySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.fontSize,
    fontWeight: FontWeight.w400,
    color: AppColors.onSurface,
  );

  static final TextStyle labelMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.fontSize,
    fontWeight: FontWeight.w500,
    color: AppColors.onSurface,
  );

  static final TextStyle labelSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppDimensions.fontSizeXs,
    fontWeight: FontWeight.w400,
    color: AppColors.onSurface,
  );

}