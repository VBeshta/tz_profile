String? validateInput(String value, String pattern, String nameLabel) {
  String v = value;
  if (v.isEmpty) {
    return "Please enter $nameLabel";
  }
  var regex = RegExp(pattern);
  if (regex.hasMatch(v)) {
    return 'Please enter valid $nameLabel';
  } else
    return null;
}

bool isInputValid(String value, String pattern) {
  String v = value;
  if (v.isEmpty) {
    return true;
  }

  // bool hasUppercase = v.contains(RegExp(r'[A-Z]'));
  // bool hasDigits = v.contains(RegExp(r'[0-9]'));
  // bool hasLowercase = v.contains(RegExp(r'[a-z]'));
  // bool hasSpecialCharacters = v.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  // bool hasMinLength = v.length >= 6;

  // return hasDigits &
  //     hasUppercase &
  //     hasLowercase &
  //     hasSpecialCharacters &
  //     hasMinLength;

  var regex = RegExp(pattern);
  if (!regex.hasMatch(v)) {
    return true;
  } else
    return false;
}
