import 'package:avid_frontend/screens/main/profile/components/profile_body.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Профиль')),
      body: ProfileBody(),
    );
  }
}