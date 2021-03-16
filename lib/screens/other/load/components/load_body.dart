import 'package:avid_frontend/res/constants.dart';
import 'package:avid_frontend/screens/other/load/components/load_bg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LoadBackground(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "AviD",
            style: GoogleFonts.montserrat(
              color: kWhiteColor,
              fontSize: 60,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: size.height * 0.1),
          Text(
            "Отвлекись от",
            style: GoogleFonts.montserrat(
                color: kWhiteColor,
                fontSize: 20,
                fontStyle: FontStyle.italic,
                shadows: <Shadow>[
                  Shadow(
                    blurRadius: 4.0,
                    color: kWhiteColor,
                    offset: Offset(1.0, 1.0),
                  ),
                ]),
          ),
          Text(
            "реальности",
            style: GoogleFonts.montserrat(
                color: kWhiteColor,
                fontSize: 20,
                fontStyle: FontStyle.italic,
                shadows: <Shadow>[
                  Shadow(
                    blurRadius: 4.0,
                    color: kWhiteColor,
                    offset: Offset(1.0, 1.0),
                  ),
                ]),
          ),
          SizedBox(height: size.height * 0.1),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(kWhiteColor),
                ),
                width: 40,
                height: 40,
              )
            ],
          ),
        ],
      ),
    ));
  }
}
