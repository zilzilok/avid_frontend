import 'package:avid_frontend/res/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          style:
              GoogleFonts.montserrat(color: kPrimaryColor, fontSize: 15),
        ),
        GestureDetector(
          onTap: onPressed,
          child: Text(
            login ? "Зарегистрируйтесь" : "Войдите",
            style: GoogleFonts.montserrat(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        )
      ],
    );
  }
}
