class EventInfo {
  String? title;
  String? description;
  DateTime? dateTime;

  EventInfo({this.title, this.description, this.dateTime});

  static EventInfo fromJson(Map<String, dynamic>? json) {
    print(json?["dateTime"]);
    print("jell");
    return EventInfo(
      title: json?["title"],
      description: json?["description"],
      dateTime: json?["joinedDate"] == null
          ? null
          : DateTime.parse(json?["joinedDate"]),
    );
  }

  static List<EventInfo>? listFromJson(List<dynamic>? json) {
    print(json);
    print("jeje");
    return json?.map((value) => EventInfo.fromJson(value)).toList() ??
        <EventInfo>[];
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "dateTime": dateTime.toString(),
    };
  }
}
