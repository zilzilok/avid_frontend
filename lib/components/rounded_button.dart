import 'package:avid_frontend/res/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color bgColor;
  final Color textColor;
  final Color borderColor;

  RoundedButton({
    Key key,
    this.bgColor = kPrimaryColor,
    this.textColor = Colors.white,
    this.onPressed,
    this.borderColor,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width * 0.7,
        child: Container(
          decoration: borderColor != null
              ? BoxDecoration(
                  border: Border.all(width: 1, color: borderColor),
                  borderRadius: BorderRadius.all(Radius.circular(29)),
                )
              : null,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(bgColor),
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 17, horizontal: 20)),
              ),
              onPressed: onPressed,
              child: Text(
                text,
                style: GoogleFonts.montserrat(
                  color: textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ));
  }
}
