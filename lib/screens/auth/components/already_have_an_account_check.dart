import 'package:avid_frontend/res/constants.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function onPressed;
  const AlreadyHaveAnAccountCheck({
    Key key,
    this.login = true,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Нет аккаунта? " : "Уже есть аккаунт? ",
          style: TextStyle(color: kPrimaryColor),
        ),
        GestureDetector(
          onTap: onPressed,
          child: Text(
            login ? "Зарегистрируйтесь" : "Войдите",
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}