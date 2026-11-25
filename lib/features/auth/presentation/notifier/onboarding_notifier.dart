import 'package:finme/core/providers/secure_storage_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingController extends AsyncNotifier<bool?>{

  static const String hasOnboarded = "hasOnboarded";

  @override
  Future<bool?> build() async {
    final isOnboarded = await ref.watch(secureStorageProvider).get(hasOnboarded);

    return bool.parse(isOnboarded);
  }

  Future<void> complete() async{
    await ref.read(secureStorageProvider).save(hasOnboarded, 'true');
    state = const AsyncData(true);
  }
}

final onboardingControllerProvider = AsyncNotifierProvider<OnboardingController, bool?>(OnboardingController.new);
