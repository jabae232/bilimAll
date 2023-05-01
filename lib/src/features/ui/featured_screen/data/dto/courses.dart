import 'dart:convert';

List<Courses> coursesFromJson(String str) => List<Courses>.from(json.decode(str).map((x) => Courses.fromJson(x)));

String coursesToJson(List<Courses> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Courses {
  String id;
  List<String> videoLessons;
  String imageUrl;
  dynamic price;
  String name;
  String description;
  String iframe;
  Category category;
  List<String> teachers;

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
  });

  factory Courses.fromJson(Map<String, dynamic> json) => Courses(
    id: json["id"],
    videoLessons: List<String>.from(json["video_lessons"].map((x) => x)),
    imageUrl: json["image_url"],
    price: json["price"],
    name: json["name"],
    description: json["description"],
    iframe: json["iframe"],
    category: Category.fromJson(json["category"]),
    teachers: List<String>.from(json["teachers"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "video_lessons": List<dynamic>.from(videoLessons.map((x) => x)),
    "image_url": imageUrl,
    "price": price,
    "name": name,
    "description": description,
    "iframe": iframe,
    "category": category.toJson(),
    "teachers": List<dynamic>.from(teachers.map((x) => x)),
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
