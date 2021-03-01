import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Column(
        children: [
          Text("Логин"),
          Text("Имя фамилия"),
          Text("Страна"),
        ],
      ),
    );
  }
}
