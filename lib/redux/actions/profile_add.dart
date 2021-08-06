import 'package:flutter/material.dart';
import 'package:personal_schedular/redux/models/user_info.dart';

@immutable
class ProfileAddAction {
  final UserInfo userProfile;
  ProfileAddAction(this.userProfile);
}

@immutable
class ProfileRemoveAction {
}
