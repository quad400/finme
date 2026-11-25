import 'package:finme/features/auth/presentation/notifier/onboarding_notifier.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RouterNotifier extends ChangeNotifier {
  RouterNotifier(Ref ref) {
    ref.listen(onboardingControllerProvider, (_, _) {
      notifyListeners();
    });
  }
}
