import 'package:finme/core/theme/app_color.dart';
import 'package:finme/core/theme/app_dimensions.dart';
import 'package:finme/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final bool isLoading;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.buttonHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: AppDimensions.radiusXl,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.18),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.12),
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: AppDimensions.radiusXl,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ColoredBox(color: AppColors.primary500),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment(-0.3, -1.4),
                  radius: 3,
                  stops: [0, 0.479, 1],
                  colors: [
                    AppColors.white.withValues(alpha: 0.43),
                    AppColors.white.withValues(alpha: 0),
                    AppColors.white.withValues(alpha: 0),
                  ],
                ),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment(0.7, 1.4),
                  radius: 2,
                  stops: [0, 0.1, 1],
                  colors: [
                    AppColors.white.withValues(alpha: 0.43),
                    AppColors.white.withValues(alpha: 0.1),
                    AppColors.white.withValues(alpha: 0),
                  ],
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onPressed,
                child: Opacity(
                  opacity: 1,
                  child: Center(
                    child: isLoading
                        ? SizedBox(child: CircularProgressIndicator.adaptive())
                        : Text(
                            label,
                            style: AppTextStyle.bodyLarge.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
