// To parse this JSON data, do
//
//     final accountDto = accountDtoFromJson(jsonString);

import 'dart:convert';

AccountDto accountDtoFromJson(String str) => AccountDto.fromJson(json.decode(str));

String accountDtoToJson(AccountDto data) => json.encode(data.toJson());

class AccountDto {
  String id;
  List<String> courses;
  String password;
  String fullName;
  List<String> whishlist;
  String email;

  AccountDto({
    required this.id,
    required this.courses,
    required this.password,
    required this.fullName,
    required this.whishlist,
    required this.email,
  });

  factory AccountDto.fromJson(Map<String, dynamic> json) => AccountDto(
    id: json["id"],
    courses: List<String>.from(json["courses"].map((x) => x)),
    password: json["password"],
    fullName: json["full_name"],
    whishlist: List<String>.from(json["whishlist"].map((x) => x)),
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "courses": List<dynamic>.from(courses.map((x) => x)),
    "password": password,
    "full_name": fullName,
    "whishlist": List<dynamic>.from(whishlist.map((x) => x)),
    "email": email,
  };
}
