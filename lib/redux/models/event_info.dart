import 'package:flutter/material.dart';

class EventInfo {
  String? title;
  String? description;
  DateTime? dateTime;
  String? time;
  String? meetLink;
  String? address;

  EventInfo(
      {this.title,
      this.description,
      this.dateTime,
      this.time,
      this.meetLink,
      this.address});

  static EventInfo fromJson(Map<String, dynamic>? json) {
    print(json?["dateTime"]);
    return EventInfo(
      title: json?["title"],
      description: json?["description"],
      dateTime:
          json?["dateTime"] == null ? null : DateTime.parse(json?["dateTime"]),
      time: json?["joinedTime"],
      meetLink: json?["meetLink"],
      address: json?["address"],
    );
  }

  static List<EventInfo>? listFromJson(List<dynamic>? json) {
    return json?.map((value) => EventInfo.fromJson(value)).toList() ??
        <EventInfo>[];
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "dateTime": dateTime.toString(),
      "joinedTime": time,
      "meetLink": meetLink,
      "address": address
    };
  }
}
