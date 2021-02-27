import 'package:avid_frontend/screens/auth/components/already_have_an_account_check.dart';
import 'package:avid_frontend/screens/auth/reg/components/reg_form_page.dart';
import 'package:flutter/material.dart';

class RegBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: size.height * 0.05),
          Text(
            "ЗАРЕГИСТРИРОВАТЬ НОВЫЙ АККАУНТ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height * 0.05),
          RegFormPage(),
          SizedBox(height: size.height * 0.03),
          AlreadyHaveAnAccountCheck(
            login: false,
            onPressed: () {
              Navigator.popAndPushNamed(context, "/login");
            },
          ),
        ],
      ),
    );
  }
}
