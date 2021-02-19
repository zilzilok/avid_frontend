import 'package:avid_frontend/res/constants.dart';
import 'package:avid_frontend/screens/auth/reg/reg_screen.dart';
import 'package:flutter/material.dart';
import 'package:avid_frontend/screens/auth/login/login_screen.dart';
import 'package:avid_frontend/screens/welcome/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
      ),
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => WelcomeScreen(),
        '/login': (BuildContext context) => LoginScreen(),
        '/register': (BuildContext context) => RegScreen(),
      },
      initialRoute: '/',
    );
  }
}
