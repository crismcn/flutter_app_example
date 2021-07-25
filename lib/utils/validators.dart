import 'package:app_example/utils/ui_texts.dart';

class InputValidators {
  InputValidators._();

  static String? emailIsValid(String? email) {
    final test =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    final isValid = RegExp(test).hasMatch(email ?? '');

    return (email!.isEmpty || !isValid)
        ? UITexts.invalidEmailValidatorText
        : null;
  }

  static String? passwordIsValid(String? password) => (password!.isEmpty)
      ? UITexts.emptyPasswordValidatorText
      : (password.length < 6)
          ? UITexts.invalidPasswordValidatorText
          : null;
}
