import 'package:flutter/material.dart';
import 'package:personal_schedular/Profile/profile.dart';

class ProfileIndex extends StatelessWidget {
  final Function _handleTap;
  ProfileIndex(this._handleTap);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Profile(_handleTap),
    );
  }
}
