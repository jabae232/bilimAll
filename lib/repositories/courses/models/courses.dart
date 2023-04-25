import 'package:bilim_all/repositories/courses/models/category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'courses.g.dart';

@JsonSerializable()
class CoursesModel{
  final String id;
  final String overview;
  final String color;

  @JsonKey(name: "image_url")
  final String imageUrl;

  final String name;
  final String description;
  final String iframe;
  final List<String> teachers;

  @JsonKey(name: "video_lessons")
  final List<String> videoLessons;

  final Category category;
  final String price;
  CoursesModel({
    required this.id,
    required this.videoLessons,
    required this.teachers,
    required this.price,
    required this.overview,
    required this.iframe,
    required this.description,
    required this.imageUrl,
    required this.color,
    required this.name,
    required this.category,
});
  factory CoursesModel.fromJson(Map<String, dynamic> json) => _$CoursesFromJson(json);
  Map<String, dynamic> toJson() => _$CoursesToJson(this);
}