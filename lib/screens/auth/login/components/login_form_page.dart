import 'package:avid_frontend/components/rounded_button.dart';
import 'package:avid_frontend/screens/auth/components/rounded_input_field.dart';
import 'package:avid_frontend/screens/auth/components/rounded_password_field.dart';
import 'package:avid_frontend/screens/auth/components/validator.dart';
import 'package:flutter/material.dart';

class LoginFormPage extends StatefulWidget {
  @override
  _LoginFormPageState createState() => _LoginFormPageState();
}

class _LoginFormPageState extends State<LoginFormPage> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _loginController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    if (_passwordController != null) _passwordController.dispose();
    if (_loginController != null) _loginController.dispose();
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
              validator: Validator.login,
            ),
            RoundedPasswordField(
              hintText: "Введите пароль",
              controller: _passwordController,
              validator: Validator.passwordNotEmpty,
            ),
            RoundedButton(
              text: "Войти",
              onPressed: () {
                if (_formkey.currentState.validate()) {}
              },
            ),
          ],
        ),
      ),
    );
  }
}
