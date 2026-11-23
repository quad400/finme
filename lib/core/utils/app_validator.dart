class AppValidator {
  AppValidator._();

  static String? required(String? value, {String field = 'Field'}) {
    if (value != null && value.isEmpty) {
      return '$field is required';
    }
    return null;
  }

  static String? email(String? value) {
    if (value != null && value.isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(r'^[\w.+-]+@[\w-]+\.[\w.-]+$');

    if (value != null && !emailRegex.hasMatch(value.trim())) {
      return "Enter a valid email address";
    }

    return null;
  }

  static String? password(String? value) {
    if (value != null && value.isEmpty) {
      return 'Password is required';
    }
    final passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    );

    if (value != null && !passwordRegex.hasMatch(value.trim())) {
      return "Password must contain uppercase, lowercase, number, special character and at least 8 characters";
    }

    return null;
  }
}
