import 'dart:io';

import 'package:avid_frontend/components/app_utils.dart';
import 'package:avid_frontend/components/rounded_button.dart';
import 'package:avid_frontend/screens/auth/api/auth_api.dart';
import 'package:avid_frontend/screens/auth/components/input_field.dart';
import 'package:avid_frontend/screens/auth/components/password_field.dart';
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
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            InputField(
              hintText: "логин",
              controller: _loginController,
              validator: Validator.login(),
            ),
            InputField(
              hintText: "почта",
              controller: _emailController,
              validator: Validator.email(),
            ),
            PasswordField(
              hintText: "придумайте пароль",
              controller: _passwordController,
              validator: Validator.passwordNotEmpty(),
            ),
            PasswordField(
              hintText: "повторите пароль",
              controller: _mPasswordController,
              validator: (String matchingPassword) {
                if (matchingPassword.isEmpty) {
                  return "пароль не может быть пустым";
                }
                if (_passwordController.text != matchingPassword) {
                  return "пароли не совпадают";
                }
                return null;
              },
            ),
            SizedBox(height: size.height * 0.03),
            RoundedButton(
              text: "продолжить",
              onPressed: () async {
                if (_formkey.currentState.validate()) {
                  var username = _loginController.text;
                  var email = _emailController.text;
                  var password = _passwordController.text;
                  var matchingPassword = _mPasswordController.text;
                  var statusCode = await AuthApi.attemptRegister(
                      username, email, password, matchingPassword);
                  if (statusCode == HttpStatus.ok) {
                    AppUtils.displayDialog(context, "Поздравляем!",
                        "Аккаунт успешно зарегистрирован.");
                    Navigator.popAndPushNamed(context, '/login');
                  } else if (statusCode == HttpStatus.conflict) {
                    AppUtils.displayDialog(context, "Ошибка!",
                        "Аккаунт с такой почтой или логином уже существует.");
                  } else {
                    AppUtils.displayDialog(context, "Ошибка регистрации!", "");
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
