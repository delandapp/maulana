class EmailValidator {
  static bool isValidEmail(String? email) {
    final emailPattern = RegExp(r'^[a-zA-Z0-9._%+-]+@smk\.belajar\.id$');
    return emailPattern.hasMatch(email??"");
  }
}

class PasswordValidator {
  static bool isValidPasswordUpper({String? password= ""}) {
    final passwordUpper = RegExp(r'[A-Z]');
    return passwordUpper.hasMatch(password??"");
  }

  static bool isValidPasswordSymbol({String? password= ""}) {
    final passwordSymbol = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    return passwordSymbol.hasMatch(password??"");
  }

  static bool isConfirmPassword(String? password, String? confirmPassword) {
    return password == confirmPassword ? false : true;
  }
}
