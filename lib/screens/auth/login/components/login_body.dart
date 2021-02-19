import 'package:avid_frontend/components/rounded_button.dart';
import 'package:avid_frontend/screens/auth/components/already_have_an_account_check.dart';
import 'package:avid_frontend/screens/auth/components/rounded_input_field.dart';
import 'package:avid_frontend/screens/auth/components/rounded_password_field.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: size.height * 0.05),
          Text(
            "ВОЙТИ В СУЩЕСТВУЮЩИЙ АККАУНТ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height * 0.05),
          RoundedInputField(
            hintText: "Введите логин/email",
            onChanged: (value) {},
          ),
          RoundedPasswordField(hintText: "Введите пароль",),
          RoundedButton(
            text: "Войти",
            onPressed: () {},
          ),
          SizedBox(height: size.height * 0.03),
          AlreadyHaveAnAccountCheck(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/register");
            },
          ),
        ],
      ),
    );
  }
}