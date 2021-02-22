class Validator {
  static Function login() {
    return (String login) {
      RegExp regex =
          RegExp(r'^[a-zA-Z0-9]([._-](?![._-])|[a-zA-Z0-9]){3,18}[a-zA-Z0-9]$');
      if (!regex.hasMatch(login)) {
        return "Введен недопустимый логин";
      }
      return null;
    };
  }

  static Function passwordNotEmpty() {
    return (String password) {
      if (password.isEmpty) {
        return "Пароль не может быть пустым";
      }
      return null;
    };
  }
}
