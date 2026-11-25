import 'package:finme/features/auth/presentation/provider/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VerifyEmailNotifier extends AsyncNotifier<void> {
  @override
  void build() {}

  Future<void> verifyEmail(String email) async {
    state = AsyncLoading();

    state = await AsyncValue.guard(() async {
      return await ref.read(verifyEmailUseCaseProvider);
    });
  }
}


final verifyEmailProvider = AsyncNotifierProvider<VerifyEmailNotifier, void>(VerifyEmailNotifier.new);