import 'package:avid_frontend/screens/auth/components/already_have_an_account_check.dart';
import 'package:avid_frontend/screens/auth/login/components/login_form_page.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
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
          LoginFormPage(),
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
