class Validator {
  static String validateName({String name}) {
    if (name == null) {
      return null;
    }
    if (name.isEmpty) {
      return 'Nome nao pode ser vazio';
    }

    return null;
  }

  static String validateEmail({String email}) {
    if (email == null) {
      return null;
    }
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    if (email.isEmpty) {
      return 'Email nao pode ser vazio';
    } else if (!emailRegExp.hasMatch(email)) {
      return 'Coloque o emaio correto';
    }

    return null;
  }

  static String validatePassword({String password}) {
    if (password == null) {
      return null;
    }
    if (password.isEmpty) {
      return 'Senha nao pode ser vazia';
    } else if (password.length < 6) {
      return 'coloque uma senha com pelo menos 6 caracters';
    }

    return null;
  }
}
