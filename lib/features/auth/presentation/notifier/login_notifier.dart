import 'dart:async';

import 'package:finme/features/auth/domain/entities/token.dart';
import 'package:finme/features/auth/presentation/provider/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginNotifier extends AsyncNotifier<Token?> {
  @override
  Future<Token?> build() async {
    return null;
  }

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      return ref.read(loginUseCaseProvider)(email: email, password: password);
    });
  }
}

final loginProvider = AsyncNotifierProvider<LoginNotifier, Token?>(
  LoginNotifier.new,
);
