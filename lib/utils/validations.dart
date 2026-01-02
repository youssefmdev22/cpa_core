import '../generated/l10n.dart';

class Validations {
  Validations._();

  static String? validateEmail(String? val) {
    final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (val == null) {
      return CoreLocalizations().emailIsRequired;
    } else if (val.trim().isEmpty) {
      return CoreLocalizations().emailIsRequired;
    } else if (emailRegex.hasMatch(val) == false) {
      return CoreLocalizations().enterValidEmail;
    } else {
      return null;
    }
  }

  static String? validatePassword(String? val) {
    final RegExp passwordRegex = RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[#?!@$%^&*-]).{8,}$',
    );
    if (val == null) {
      return CoreLocalizations().passwordIsRequired;
    } else if (val.isEmpty) {
      return CoreLocalizations().passwordIsRequired;
    } else if (val.length < 8 || !passwordRegex.hasMatch(val)) {
      return CoreLocalizations().passwordNotMatched;
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? val, String? password) {
    if (val == null || val.isEmpty) {
      return CoreLocalizations().passwordIsRequired;
    } else if (val != password) {
      return CoreLocalizations().passwordNotMatched;
    } else {
      return null;
    }
  }

  static String? validateUsername(String? val) {
    final RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9,.-]+$');
    if (val == null) {
      return CoreLocalizations().thisFieldIsRequired;
    } else if (val.isEmpty) {
      return CoreLocalizations().thisFieldIsRequired;
    } else if (!usernameRegex.hasMatch(val)) {
      return CoreLocalizations().enterValidUsername;
    } else {
      return null;
    }
  }

  static String? validateFullName(String? val) {
    if (val == null || val.isEmpty) {
      return CoreLocalizations().thisFieldIsRequired;
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String? val) {
    final regex = RegExp(r'^(?:\+2)?01[0125][0-9]{8}$');

    if (val == null || val.trim().isEmpty) {
      return CoreLocalizations().thisFieldIsRequired;
    } else if (int.tryParse(val.trim()) == null) {
      return CoreLocalizations().enterNumbersOnly;
    } else if (!regex.hasMatch(val.trim())) {
      return CoreLocalizations().enterValidEgyptianPhoneNumber;
    } else {
      return null;
    }
  }

  static String? validateAddress(String? val) {
    final RegExp addressRegex = RegExp(r"^[\p{L}\d\s,.\-\/#]+$", unicode: true);

    if (val == null || val.trim().isEmpty) {
      return CoreLocalizations().pleaseEnterAddress;
    }

    if (!addressRegex.hasMatch(val.trim())) {
      return CoreLocalizations().pleaseEnterValidAddress;
    }

    return null;
  }

  static String? validateCashoutEmail(String? val) {
    if (val == null) {
      return CoreLocalizations().emailIsRequired;
    } else if (val.trim().isEmpty) {
      return CoreLocalizations().emailIsRequired;
    } else {
      return null;
    }
  }

  static String? validateCode(String? val) {
    if (val == null || val.trim().isEmpty || val.trim().length != 6) {
      return CoreLocalizations().pleaseEnterValidCode;
    } else {
      return null;
    }
  }

  static String? validateNumberOnly(String? val) {
    final regex = RegExp(r'^[1-9][0-9]*$');

    if (val == null || val.trim().isEmpty) {
      return CoreLocalizations().pleaseEnterValidNumber;
    }

    if (!regex.hasMatch(val.trim())) {
      return CoreLocalizations().pleaseEnterValidNumber;
    }
    return null;
  }

  static String? validateEmpty(String? val) {
    if (val == null || val.trim().isEmpty) {
      return CoreLocalizations().thisFieldIsRequired;
    }
    return null;
  }

  static String? validateUrl(String? val) {
    if (val == null || val.trim().isEmpty) {
      return CoreLocalizations().thisFieldIsRequired;
    }

    final uri = Uri.tryParse(val.trim());

    if (uri == null || (!uri.hasAuthority && uri.host.isEmpty)) {
      return CoreLocalizations().pleaseEnterValidUrl;
    }
    return null;
  }

}
