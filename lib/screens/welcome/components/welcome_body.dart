import 'package:avid_frontend/components/rounded_button.dart';
import 'package:avid_frontend/res/constants.dart';
import 'package:avid_frontend/screens/welcome/components/welcome_bg.dart';
import 'package:flutter/material.dart';

class WelcomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WelcomeBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            RoundedButton(
              text: "войти в аккаунт",
              bgColor: kWhiteColor,
              textColor: kPrimaryColor,
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            SizedBox(height: size.height * 0.03),
            RoundedButton(
              text: "зарегистрироваться",
              bgColor: kPrimaryColor,
              borderColor: kWhiteColor,
              textColor: kWhiteColor,
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
            ),
            SizedBox(height: size.height * 0.1),
          ],
        ),
      ),
    );
  }
}
