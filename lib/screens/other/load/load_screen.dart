import 'package:avid_frontend/screens/other/load/components/load_body.dart';
import 'package:flutter/material.dart';

class LoadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: LoadBody(),
      ),
    );
  }
}
