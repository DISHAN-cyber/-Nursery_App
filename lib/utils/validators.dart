class AppValidators {
  static bool isValidEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return false;
    }
    return RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value);
  }

  static bool isValidPassword(String? value) {
    return value != null && value.length >= 6;
  }
}
