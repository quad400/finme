import 'package:finme/core/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:finme/core/theme/app_dimensions.dart';
import 'package:finme/core/theme/app_text_style.dart';
import 'package:finme/core/constants/app_images.dart';
import 'package:finme/core/theme/app_color.dart';
import 'package:finme/features/auth/presentation/provider/onboarding_provider.dart';
import 'package:finme/core/shared/widget/primary_button.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboaridngScreenState();
}

class _OnboaridngScreenState extends ConsumerState<OnboardingScreen> {
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final _pageController = PageController();
  int _currentPage = 0;

  void _onPageChanged(int page) => setState(() => _currentPage = page);

  void _handleNext() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      ref.read(onboardingControllerProvider.notifier).complete();
      context.go(AppRoutes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    final onboardingList = ref.read(onboardingProvider);

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingList.length,
                onPageChanged: _onPageChanged,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: AppDimensions.screenHeight * 0.4,
                        width: AppDimensions.screenWidth * 0.8,
                        child: Image.asset(
                          AppImages.onboarding,
                          fit: BoxFit.contain,
                        ),
                      ),

                      const SizedBox(height: 20),

                      SizedBox(
                        width: AppDimensions.screenWidth * 0.7,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,

                          children: [
                            Text(
                              onboardingList[index].title,
                              textAlign: TextAlign.center,
                              style: AppTextStyle.displayMedium,
                            ),
                            Text(
                              onboardingList[index].description,
                              textAlign: TextAlign.center,
                              style: AppTextStyle.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 4,
              children: List.generate(onboardingList.length, (index) {
                final isActive = index == _currentPage;
                return AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  width: isActive ? 30 : 10,
                  height: 10,
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    color: isActive ? AppColors.primary500 : AppColors.muted,
                    borderRadius: BorderRadius.circular(5),
                  ),
                );
              }),
            ),
            SizedBox(height: AppDimensions.screenHeight * 0.1),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: AppDimensions.sideSpacing,
              ),
              child: PrimaryButton(
                label: "Next",
                onPressed: () => _handleNext(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
