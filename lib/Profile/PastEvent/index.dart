import 'package:flutter/material.dart';
import 'package:personal_schedular/Profile/PastEvent/pastEvent.dart';
import 'package:personal_schedular/config/Theme/colors.dart';

class PastEventIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsSchedular.primaryLight1,
        iconTheme: IconThemeData(color: ColorsSchedular.primary),
        elevation: 0,
        automaticallyImplyLeading: true,
      ),
      body: PastEvent(),
    ));
  }
}
