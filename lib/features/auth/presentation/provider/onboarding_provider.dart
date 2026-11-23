import 'package:finme/core/storage/local_storage.dart';
import 'package:finme/features/auth/domain/entities/onboarding.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final onboardingProvider = Provider<List<Onboarding>>((ref) {
  return const [
    Onboarding(
      id: '1',
      title: '100% Secured Transactions',
      description: 'Your transactions are fully protected with the highest level of security.',
    ),
    Onboarding(
      id: '2',
      title: 'We’re SEC Compliant',
      description: 'Your transactions are secure. Nothing to worry about.',
    ),
    Onboarding(
      id: '1',
      title: '24/7 Assistance Support',
      description: 'Your transactions are fully protected with the highest level of security.',
    ),
  ];
});

final onboardingControllerProvider = AsyncNotifierProvider<OnboardingController, bool?>(OnboardingController.new);

class OnboardingController extends AsyncNotifier<bool?>{

  static const String hasOnboarded = "hasOnboarded";

  @override
  Future<bool?> build() async {
    final isOnboarded = await LocalStorage.get<bool>(hasOnboarded);
    return isOnboarded;
  }

  Future<void> complete() async{
    LocalStorage.save(hasOnboarded, true);
    state = const AsyncData(true);
  }
}