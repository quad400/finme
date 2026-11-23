import 'package:finme/core/theme/app_color.dart';
import 'package:finme/core/theme/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppBackButtonVariant { plain, filled }

class AppBackButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final AppBackButtonVariant variant;

  const AppBackButton({
    super.key,
    this.onPressed,
    this.variant = AppBackButtonVariant.plain,
  });

  const AppBackButton.filled({
    super.key,
    this.onPressed,
    this.variant = AppBackButtonVariant.filled,
  });

  @override
  Widget build(BuildContext context) {
    return switch (variant) {
      AppBackButtonVariant.plain => IconButton(
        color: Colors.transparent,
        onPressed: () => context.canPop() ? context.pop() : null,
        icon: Icon(Icons.arrow_back, color: AppColors.black),
      ),
      AppBackButtonVariant.filled => Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: AppDimensions.radiusXl,
        ),
        child: IconButton(
          color: AppColors.white,
          onPressed: () => context.canPop() ? context.pop() : null,
          icon: Icon(Icons.arrow_back, color: AppColors.black),
        ),
      ),
    };
  }
}
