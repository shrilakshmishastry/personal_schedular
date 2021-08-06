class UserInfo {
  String? name;
  String? email;
  DateTime? joinedDate;
  UserInfo({this.name = "shri", this.email, this.joinedDate});

  static UserInfo fromJson(Map<String, dynamic> json) {
    print("hh");
    dynamic date = json["joinedDate"] == "null"
        ? null
        : DateTime.parse(json["joinedDate"]);
    print(json["joinedDate"] == "null");
    return UserInfo(name: json["name"], email: json["email"], joinedDate: date);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'joinedDate': joinedDate == null ? null : joinedDate.toString(),
    };
  }
}
