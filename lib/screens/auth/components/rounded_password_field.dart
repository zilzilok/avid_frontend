import 'package:avid_frontend/components/text_field_container.dart';
import 'package:avid_frontend/res/constants.dart';
import 'package:flutter/material.dart';

class RoundedPasswordField extends StatefulWidget {
  final String hintText;
  final IconData icon;

  const RoundedPasswordField({
    this.hintText = "Пароль",
    this.icon = Icons.lock,
  });

  @override
  _RoundedPasswordFieldState createState() =>
      _RoundedPasswordFieldState(this.hintText, this.icon);
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  final String hintText;
  final IconData icon;
  bool _passwordVisible;

  _RoundedPasswordFieldState(this.hintText, this.icon);

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: !_passwordVisible,
        enableSuggestions: false,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: hintText,
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: kPrimaryColor,
            ),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
