import 'package:avid_frontend/res/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorScreen extends StatelessWidget {
  final String title;
  final String message;

  ErrorScreen({
    Key key,
    this.title = "Ошибка!",
    this.message = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: new GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("assets/icons/launch_icon.png"),
                Text(
                  title,
                  style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
                ),
                Flexible(child: Text(message, style: GoogleFonts.montserrat(),)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
