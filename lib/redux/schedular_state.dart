import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:personal_schedular/redux/models/event_info.dart';
import 'package:personal_schedular/redux/models/user_info.dart';
import 'package:personal_schedular/redux/store.dart';

@immutable
class SchedularState {
  final UserInfo? userInfo;
  final List<EventInfo>? events;

  SchedularState(
      {this.userInfo,
      this.events,});

  //named constructor
  factory SchedularState.initial() => SchedularState(
      userInfo: new UserInfo(),
      events: [],
     );

  Map<String, dynamic> toJson() {
    print(events?.map((e) => e.toJson()).toList());
    return {
      "userInfo": userInfo!.toJson(),
      "events": events?.map((e) => e.toJson()).toList(),
    };
  }

  static dynamic toJsonEvents() {
    List<dynamic> listOfEvents = [];
    if (Redux.store.state.appState.events != null) {
      for (int i = 0; i < Redux.store.state.appState.events!.length; i++) {
        listOfEvents
            .add(Redux.store.state.appState.events!.elementAt(i).toJson());
      }

      return listOfEvents.toList();
    }
    return [];
  }

  static SchedularState fromJson(Map<String, dynamic> json) {
    // print(json);
    // print("hhh");
    return SchedularState(
        userInfo: UserInfo.fromJson(json["userInfo"]),
        events: EventInfo.listFromJson(json["events"]),
      );
  }

  SchedularState copyWith(
      {@required UserInfo? userInfo,
      @required List<EventInfo>? events,
     }) {
    return SchedularState(
        userInfo: userInfo ?? this.userInfo,
        events: events ?? this.events,
       );
  }
}
