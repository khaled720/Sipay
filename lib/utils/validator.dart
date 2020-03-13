class Validator {
  static bool checkIfEmailIsValid(String email) => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

  static bool checkIfPhoneNumberIsValid(String number) =>
      RegExp('^[0-9]+\$').hasMatch(number);
}
