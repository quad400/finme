import 'package:finme/core/providers/router_provider.dart';
import 'package:finme/core/router/app_routes.dart';
import 'package:finme/features/auth/presentation/notifier/onboarding_notifier.dart';
import 'package:finme/features/auth/presentation/screens/verify_email_screen.dart';
import 'package:finme/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:finme/features/auth/presentation/screens/login_screen.dart';
import 'package:finme/features/auth/presentation/screens/onboarding_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final routerNotifier = RouterNotifier(ref);

  return GoRouter(
    initialLocation: "/",
    refreshListenable: routerNotifier,
    redirect: (context, state) {
      final onboarding = ref.read(onboardingControllerProvider);
      if (onboarding.isLoading) return null;
      final hasOnboarded = onboarding.value ?? false;
      final isOnboarding = state.matchedLocation == AppRoutes.onboarding;
      if (isOnboarding && hasOnboarded) {
        return AppRoutes.login;
      }
      if (!isOnboarding && !hasOnboarded) {
        return AppRoutes.onboarding;
      }
      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => OnboardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.forgetPassword,
        builder: (context, state) => ForgetpasswordScreen(),
      ),
      GoRoute(
        path: AppRoutes.verifyEmail,
        builder: (context, state) => VerifyEmailScreen(),
      ),
    ],
  );
});
