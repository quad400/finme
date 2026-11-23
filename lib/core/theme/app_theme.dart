import 'package:finme/core/theme/app_color.dart';
import 'package:finme/core/theme/app_dimensions.dart';
import 'package:finme/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData light = _build(
    ColorScheme.fromSeed(
      seedColor: Colors.black,
      brightness: Brightness.light,
      // surface: AppColors.surface,
    ),
  );

  static final ThemeData dark = _build(
    ColorScheme.fromSeed(
      seedColor: Colors.black,
      brightness: Brightness.dark,
      // surface: AppColors.surface,
    ),
  );

  static const SystemUiOverlayStyle overlayOnLight = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
    systemNavigationBarColor: AppColors.surface,
    systemNavigationBarIconBrightness: Brightness.dark,
  );

  static const SystemUiOverlayStyle overlayOnDark = SystemUiOverlayStyle(
    statusBarColor: AppColors.white,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  static ThemeData _build(ColorScheme scheme) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.surface,
      extensions: [],
      appBarTheme: AppBarThemeData(
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        systemOverlayStyle: overlayOnLight,
        centerTitle: false,
      ),
      textTheme: TextTheme(
        displayLarge: AppTextStyle.displayLarge,
        displayMedium: AppTextStyle.displayMedium,
        displaySmall: AppTextStyle.displaySmall,
        bodyLarge: AppTextStyle.bodyLarge,
        bodyMedium: AppTextStyle.bodyMedium,
        bodySmall: AppTextStyle.bodySmall,
        labelMedium: AppTextStyle.labelMedium,
        labelSmall: AppTextStyle.labelSmall,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: Size.fromHeight(AppDimensions.buttonHeight),
          shape: RoundedRectangleBorder(borderRadius: AppDimensions.radius),
          textStyle: TextStyle(
            fontSize: AppDimensions.fontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: Size.fromHeight(AppDimensions.buttonHeight),
          shape: RoundedRectangleBorder(borderRadius: AppDimensions.radius),
          textStyle: TextStyle(
            fontSize: AppDimensions.fontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationThemeData(
        filled: false,
        prefixIconColor: AppColors.grey800,
        suffixIconColor: AppColors.grey800,
        errorStyle: AppTextStyle.bodySmall.copyWith(color: AppColors.error500),
        hintStyle: AppTextStyle.bodySmall.copyWith(color: AppColors.neutral200),
        activeIndicatorBorder: BorderSide(color: AppColors.primary500),
        border: OutlineInputBorder(
          borderRadius: AppDimensions.radiusMd,
          borderSide: BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppDimensions.radiusMd,
          borderSide: BorderSide(color: AppColors.border),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: AppDimensions.radiusMd,
          borderSide: BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppDimensions.radiusMd,
          borderSide: BorderSide(color: AppColors.primary500),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppDimensions.radiusMd,
          borderSide: BorderSide(color: AppColors.error500),
        ),
        // focusedBorder:
      ),
    );
  }
}
