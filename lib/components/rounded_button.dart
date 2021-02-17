import 'package:avid_frontend/res/constants.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {

  final String text;
  final Function onPressed;
  final Color bgColor;
  final Color textColor;

  RoundedButton({
    Key key,
    this.bgColor = kPrimaryColor,
    this.textColor = Colors.white,
    this.onPressed,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: bgColor,
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}