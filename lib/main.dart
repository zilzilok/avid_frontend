
import 'package:avid_frontend/res/constants.dart';
import 'package:avid_frontend/screens/auth/components/auth_utils.dart';
import 'package:avid_frontend/screens/auth/login/login_screen.dart';
import 'package:avid_frontend/screens/auth/reg/reg_screen.dart';
import 'package:avid_frontend/screens/main/profile/profile_screen.dart';
import 'package:avid_frontend/screens/other/error_screen.dart';
import 'package:avid_frontend/screens/other/load_screen.dart';
import 'package:avid_frontend/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: kAccentColor,
        primarySwatch: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
      ),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => LoginScreen(),
        '/register': (BuildContext context) => RegScreen(),
        '/profile': (BuildContext context) => ProfileScreen(),
      },
      home: FutureBuilder(
        future: AuthUtils.checkJwt,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            switch (snapshot.data) {
              case JwtStatus.CORRECT:
                return ProfileScreen();
              case JwtStatus.INCORRECT:
                return LoginScreen();
              default:
                return WelcomeScreen();
            }
          }
          else if (snapshot.hasError) {
            return ErrorScreen(title: "Ошибка!", message: "Возможно отсутствует подключение к интернету.",);
          }
          else {
            return LoadScreen();
          }
        },
      ),
    );
  }
}
