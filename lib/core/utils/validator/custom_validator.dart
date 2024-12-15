class CustomValidator {
  static bool isPasswordValid(String value) {
    RegExp regExp = RegExp(
      r'^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*(),.?":{}|<>])[A-Za-z0-9!@#$%^&*(),.?":{}|<>]{8,}$',
    );
    return regExp.hasMatch(value);
  }

  static bool isEmailValid(String value) {
    RegExp regExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return regExp.hasMatch(value);
  }

  static String? formValidatorEmail(String? value) {
    if (value != null && value.isEmpty) {
      return 'Please fill the email field';
    } else if (value != null && (!CustomValidator.isEmailValid(value))) {
      return 'Please enter some valid email';
    }
    return null;
  }

  static String? formValidatorPassword(String? value) {
    if (value != null && value.isEmpty) {
      return 'Please fill the password field';
    } else if (value != null && (!CustomValidator.isPasswordValid(value))) {
      return 'Need 8 minimum length, number, symbol and capitalize';
    }
    return null;
  }
}
