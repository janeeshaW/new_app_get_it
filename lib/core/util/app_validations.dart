


class AppValidations {

  ///Email validations
  String? emailValidation(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email cannot be empty';
    } else if (validateEmail(email)) {
      return null;
    } else {
      return "Incorrect Email Address";
    }
  }

  ///Password validations
  String? passwordValidation(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password cannot be empty';
    } else if (validatePW(password)) {
      return null;
    } else {
      return "Incorrect Password Format";
    }
  }

  ///Normal Text validations
  String? normalTextValidation(String? text) {
    if (text == null || text.isEmpty) {
      return 'Field cannot be empty';
    } else if (validateNormal(text)) {
      return null;
    } else {
      return "Incorrect Input";
    }
  }

  ///Mobile Number validations
  String? mobileValidation(String? text) {
    if (text == null || text.isEmpty) {
      return 'Mobile Number cannot be empty';
    } else if (validateMobile(text)) {
      return null;
    } else {
      return "Incorrect Mobile Number";
    }
  }

  /// RegExp for validating
  bool validateEmail(String value) {
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return (!regex.hasMatch(value)) ? false : true;
  }

  bool validatePW(String text) {
    RegExp regex = RegExp(r'^[a-zA-Z0-9]{8,16}$');
    return (!regex.hasMatch(text)) ? false : true;
  }

  bool validateNormal(String text) {
    RegExp regex = RegExp(r"^[0-9a-zA-Z].*");
    return (!regex.hasMatch(text)) ? false : true;
  }

  bool validateMobile(String text) {
    RegExp regex = RegExp(r'^(?:[+0]9)?[0-9]{10}$');
    return (!regex.hasMatch(text)) ? false : true;
  }
}
