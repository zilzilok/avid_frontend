import 'package:avid_frontend/res/constants.dart';
import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function onPressed;
  final EdgeInsetsGeometry margin;

  ImageButton({
    Key key,
    this.icon = Icons.person,
    this.label,
    this.onPressed,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: AspectRatio(
        aspectRatio: 1,
        child: ClipOval(
          child: Material(
            color: kPrimaryColor,
            child: InkWell(
              splashColor: kPrimaryAccentColor,
              onTap: onPressed,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      label,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
