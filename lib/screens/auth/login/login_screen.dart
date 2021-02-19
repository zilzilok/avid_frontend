import 'package:flutter/material.dart';

import 'components/login_body.dart';

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
