class InputValidators {
  InputValidators._();

  static String? emailIsValid(String email) {
    final test =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    final isValid = RegExp(test).hasMatch(email);

    return (email.isEmpty || !isValid)
        ? 'Por favor, digite um email válido.'
        : null;
  }

  static String? passwordIsValid(String password) => (password.isEmpty)
      ? 'Digite sua senha.'
      : (password.length < 6)
          ? 'Mínimo de 6 caracteres.'
          : null;
}
