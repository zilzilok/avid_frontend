import 'components/welcome_body.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Главная страница')),
      body: WelcomeBody(),
    );
  }
}
