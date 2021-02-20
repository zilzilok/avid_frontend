import 'package:avid_frontend/components/text_field_container.dart';
import 'package:avid_frontend/res/constants.dart';
import 'package:flutter/material.dart';

class RoundedPasswordField extends StatefulWidget {
  final String hintText;
  final String errorText;
  final IconData icon;
  final TextEditingController controller;
  final Function validator;

  const RoundedPasswordField({
    Key key,
    this.controller,
    this.validator,
    this.hintText = "Пароль",
    this.errorText = "Пароль должен содержать минимум 8 символов",
    this.icon = Icons.lock,
  }) : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState(
      this.hintText,
      this.errorText,
      this.icon,
      this.controller,
      this.validator);
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  final String hintText;
  final String errorText;
  final IconData icon;
  final controller;
  final validator;
  bool _passwordVisible;

  _RoundedPasswordFieldState(this.hintText, this.errorText, this.icon,
      this.controller, this.validator);

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
        controller: controller,
        validator: validator,
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
