import 'package:avid_frontend/res/constants.dart';
import 'package:avid_frontend/screens/auth/components/already_have_an_account_check.dart';
import 'package:avid_frontend/screens/auth/reg/components/reg_bg.dart';
import 'package:avid_frontend/screens/auth/reg/components/reg_form_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RegBackground(
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_sharp),
                  color: kPrimaryColor,
                  iconSize: 40,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  padding: EdgeInsets.only(top: 10),
                ),
                Text(
                  "регистрация",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.03),
            RegFormPage(),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              onPressed: () {
                Navigator.popAndPushNamed(context, "/login");
              },
            ),
            SizedBox(height: size.height * 0.05),
          ],
        ),
      ),
    );
  }
}
