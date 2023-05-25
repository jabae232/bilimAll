// To parse this JSON data, do
//
//     final courses = coursesFromJson(jsonString);

import 'dart:convert';

List<Courses> coursesFromJson(String str) => List<Courses>.from(json.decode(str).map((x) => Courses.fromJson(x)));

String coursesToJson(List<Courses> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Courses {
  String id;
  List<VideoLesson> videoLessons;
  String imageUrl;
  int price;
  String name;
  String description;
  String iframe;
  Category category;
  List<Teacher> teachers;
  bool isBought;

  Courses({
    required this.id,
    required this.videoLessons,
    required this.imageUrl,
    required this.price,
    required this.name,
    required this.description,
    required this.iframe,
    required this.category,
    required this.teachers,
    required this.isBought,
  });

  factory Courses.fromJson(Map<String, dynamic> json) => Courses(
    id: json["id"],
    videoLessons: List<VideoLesson>.from(json["video_lessons"].map((x) => VideoLesson.fromJson(x))),
    imageUrl: json["image_url"],
    price: json["price"],
    name: json["name"],
    description: json["description"],
    iframe: json["iframe"],
    category: Category.fromJson(json["category"]),
    teachers: List<Teacher>.from(json["teachers"].map((x) => Teacher.fromJson(x))),
    isBought: json["isBought"],
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
    "isBought": isBought,
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
  String fullName;
  String avatar;

  Teacher({
    required this.id,
    required this.fullName,
    required this.avatar,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
    id: json["id"],
    fullName: json["full_name"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "full_name": fullName,
    "avatar": avatar,
  };
}

class VideoLesson {
  String id;
  String name;
  String iframe;

  VideoLesson({
    required this.id,
    required this.name,
    required this.iframe,
  });

  factory VideoLesson.fromJson(Map<String, dynamic> json) => VideoLesson(
    id: json["id"],
    name: json["name"],
    iframe: json["iframe"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "iframe": iframe,
  };
}
