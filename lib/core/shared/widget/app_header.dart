import 'package:finme/core/theme/app_dimensions.dart';
import 'package:finme/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  final String title;
  final String? subtitle;

  const new({super.key, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: AppDimensions.padding),
      child: Column(
        spacing: AppDimensions.paddingXs,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyle.displayMedium.copyWith(
              fontSize: AppDimensions.fontSizelg,
            ),
          ),
          if (subtitle != null)
            Text(
              subtitle!,
              textAlign: TextAlign.center,
              style: AppTextStyle.bodySmall.copyWith(),
            ),
        ],
      ),
    );
  }
}
