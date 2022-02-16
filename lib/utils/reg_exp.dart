validateEmail(String email) {
  bool isValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  return isValid;
}

validateEmptyString(String str) {
  bool isValid = str.length > 0 ? true : false;
  return isValid;
}

validatePassword(String password) {
  // Minimum 1 Upper case
  // Minimum 1 lowercase
  // Minimum 1 Numeric Number
  // Minimum 1 Special Character
  // Common Allow Character ( ! @ # $ & * ~ )
  
  bool isValid = password.length > 6 ? true : false;
  String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = RegExp(pattern);
  isValid = isValid && regExp.hasMatch(password);

  return isValid;
}