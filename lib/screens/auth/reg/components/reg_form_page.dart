import 'package:avid_frontend/components/app_utils.dart';
import 'package:avid_frontend/components/rounded_button.dart';
import 'package:avid_frontend/screens/auth/api/auth_api.dart';
import 'package:avid_frontend/screens/auth/components/rounded_input_field.dart';
import 'package:avid_frontend/screens/auth/components/rounded_password_field.dart';
import 'package:avid_frontend/screens/auth/components/validator.dart';
import 'package:flutter/material.dart';

class RegFormPage extends StatefulWidget {
  @override
  _RegFormPage createState() => _RegFormPage();
}

class _RegFormPage extends State<RegFormPage> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _mPasswordController = TextEditingController();
  TextEditingController _loginController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    if (_passwordController != null) _passwordController.dispose();
    if (_mPasswordController != null) _mPasswordController.dispose();
    if (_loginController != null) _loginController.dispose();
    if (_emailController != null) _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            RoundedInputField(
              hintText: "Введите логин",
              controller: _loginController,
              validator: Validator.login(),
            ),
            RoundedInputField(
              hintText: "Введите email",
              controller: _emailController,
              validator: Validator.email(),
            ),
            RoundedPasswordField(
              hintText: "Введите пароль",
              controller: _passwordController,
              validator: Validator.passwordNotEmpty(),
            ),
            RoundedPasswordField(
              hintText: "Повторите пароль",
              controller: _mPasswordController,
              validator: (String matchingPassword) {
                if (matchingPassword.isEmpty) {
                  return "Пароль не может быть пустым";
                }
                if (_passwordController.text != matchingPassword) {
                  return "Пароли не совпадают";
                }
                return null;
              },
            ),
            RoundedButton(
              text: "Продолжить",
              onPressed: () async {
                if (_formkey.currentState.validate()) {
                  var username = _loginController.text;
                  var email = _emailController.text;
                  var password = _passwordController.text;
                  var matchingPassword = _mPasswordController.text;
                  var statusCode = await AuthApi.attemptRegister(
                      username, email, password, matchingPassword);
                  if (statusCode == 200) {
                    AppUtils.displayDialog(
                        context, "Поздравляем!", "Аккаунт успешно зарегистрирован.");
                    Navigator.popAndPushNamed(context, '/login');
                  } else {
                    AppUtils.displayDialog(
                        context, "Ошибка регистрации!", "");
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
