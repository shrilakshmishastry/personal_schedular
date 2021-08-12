class UserInfo {
  String? password;
  String? email;
  DateTime? joinedDate;
  UserInfo({this.password, this.email, this.joinedDate});

  static UserInfo fromJson(Map<String, dynamic> json) {
    print("hh");
    dynamic date = json["joinedDate"] == "null"
        ? null
        : DateTime.parse(json["joinedDate"]);
    print(json["joinedDate"] == "null");
    return UserInfo(password: json["password"], email: json["email"], joinedDate: date);
  }

  Map<String, dynamic> toJson() {
    return {
      'password': password,
      'email': email,
      'joinedDate': joinedDate == null ? null : joinedDate.toString(),
    };
  }
}
