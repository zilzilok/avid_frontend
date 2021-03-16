
import 'package:avid_frontend/components/app_utils.dart';
import 'package:avid_frontend/components/rounded_button.dart';
import 'package:avid_frontend/screens/auth/api/auth_api.dart';
import 'package:avid_frontend/screens/auth/components/auth_utils.dart';
import 'package:avid_frontend/screens/auth/components/input_field.dart';
import 'package:avid_frontend/screens/auth/components/password_field.dart';
import 'package:avid_frontend/screens/auth/components/validator.dart';
import 'package:flutter/material.dart';

class LoginFormPage extends StatefulWidget {
  @override
  _LoginFormPageState createState() => _LoginFormPageState();
}

class _LoginFormPageState extends State<LoginFormPage> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _loginController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    if (_passwordController != null) _passwordController.dispose();
    if (_loginController != null) _loginController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            InputField(
              hintText: "логин",
              controller: _loginController,
              validator: Validator.login(),
            ),
            PasswordField(
              hintText: "пароль",
              controller: _passwordController,
              validator: Validator.passwordNotEmpty(),
            ),
            SizedBox(height: size.height * 0.03),
            RoundedButton(
              text: "войти",
              onPressed: () async {
                if (_formkey.currentState.validate()) {
                  var username = _loginController.text;
                  var password = _passwordController.text;
                  var jwt = await AuthApi.attemptAuth(username, password);
                  if (jwt != null) {
                    AuthUtils.saveJwt(jwt);
                    Navigator.popUntil(context, (route) => route.isFirst);
                    Navigator.popAndPushNamed(context, '/profile');
                  } else {
                    AppUtils.displayDialog(context, "Ошибка авторизации!",
                        "Аккаунта с такими данными не было найдено.");
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
