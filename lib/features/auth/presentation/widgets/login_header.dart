import 'package:finme/core/theme/app_color.dart';
import 'package:flutter/widgets.dart';

import 'package:finme/core/theme/app_text_style.dart';
import 'package:finme/core/constants/app_images.dart';
import 'package:finme/core/theme/app_dimensions.dart';
import 'package:finme/core/shared/widget/app_back_button.dart';


class LoginHeader extends StatelessWidget {
  const new({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary700
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: AppDimensions.paddingXxxl),
        child: SizedBox(
          width: double.infinity,
          height: 220,
          child: Stack(
            children: [
              Positioned.fill(
                top: 0,
                left: 0,
                right: 0,
                child: Image.asset(
                  AppImages.star,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
              Align(
                alignment: AlignmentGeometry.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: AppDimensions.sideSpacing,
                    right: AppDimensions.sideSpacing,
                    top: AppDimensions.paddingXxxl,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: AppDimensions.paddingMd,
                    children: [
                      AppBackButton.filled(),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Welcome Back",
                              style: AppTextStyle.displayMedium.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                            Text(
                              "Login to access your account, track your \n spending and manage your finances.",
                              style: AppTextStyle.bodyMedium.copyWith(
                                color: AppColors.white,
                              ),
                
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
