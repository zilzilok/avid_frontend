import 'package:avid_frontend/screens/auth/login/components/login_body.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Авторизация'),
      ),
      body: LoginBody(),
    );
  }
}
