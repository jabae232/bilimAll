// To parse this JSON data, do
//
//     final wishlistDto = wishlistDtoFromJson(jsonString);

import 'dart:convert';

List<WishlistDto> wishlistDtoFromJson(String str) => List<WishlistDto>.from(json.decode(str).map((x) => WishlistDto.fromJson(x)));

String wishlistDtoToJson(List<WishlistDto> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WishlistDto {
  String id;
  List<VideoLesson> videoLessons;
  String imageUrl;
  int price;
  String name;
  String description;
  String iframe;
  Category category;
  List<Teacher> teachers;

  WishlistDto({
    required this.id,
    required this.videoLessons,
    required this.imageUrl,
    required this.price,
    required this.name,
    required this.description,
    required this.iframe,
    required this.category,
    required this.teachers,
  });

  factory WishlistDto.fromJson(Map<String, dynamic> json) => WishlistDto(
    id: json["id"],
    videoLessons: List<VideoLesson>.from(json["video_lessons"].map((x) => VideoLesson.fromJson(x))),
    imageUrl: json["image_url"],
    price: json["price"],
    name: json["name"],
    description: json["description"],
    iframe: json["iframe"],
    category: Category.fromJson(json["category"]),
    teachers: List<Teacher>.from(json["teachers"].map((x) => Teacher.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "video_lessons": List<dynamic>.from(videoLessons.map((x) => x.toJson())),
    "image_url": imageUrl,
    "price": price,
    "name": name,
    "description": description,
    "iframe": iframe,
    "category": category.toJson(),
    "teachers": List<dynamic>.from(teachers.map((x) => x.toJson())),
  };
}

class Category {
  String id;
  String color;
  Name name;
  String key;

  Category({
    required this.id,
    required this.color,
    required this.name,
    required this.key,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    color: json["color"],
    name: Name.fromJson(json["name"]),
    key: json["key"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "color": color,
    "name": name.toJson(),
    "key": key,
  };
}

class Name {
  String ru;
  String en;
  String kz;

  Name({
    required this.ru,
    required this.en,
    required this.kz,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    ru: json["ru"],
    en: json["en"],
    kz: json["kz"],
  );

  Map<String, dynamic> toJson() => {
    "ru": ru,
    "en": en,
    "kz": kz,
  };
}

class Teacher {
  String id;
  String? fullName;
  String email;
  bool isTeacher;
  String password;
  String avatar;

  Teacher({
    required this.id,
    required this.fullName,
    required this.email,
    required this.isTeacher,
    required this.password,
    required this.avatar,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
    id: json["id"],
    fullName: json["full_name"],
    email: json["email"],
    isTeacher: json["isTeacher"],
    password: json["password"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "full_name": fullName,
    "email": email,
    "isTeacher": isTeacher,
    "password": password,
    "avatar": avatar,
  };
}

class VideoLesson {
  String id;
  String name;
  String iframe;
  String? text;

  VideoLesson({
    required this.id,
    required this.name,
    required this.iframe,
    this.text,
  });

  factory VideoLesson.fromJson(Map<String, dynamic> json) => VideoLesson(
    id: json["id"],
    name: json["name"],
    iframe: json["iframe"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "iframe": iframe,
    "text": text,
  };
}
