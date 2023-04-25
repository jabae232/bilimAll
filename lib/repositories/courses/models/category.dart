
import 'package:json_annotation/json_annotation.dart';

import 'name.dart';
part 'category.g.dart';
@JsonSerializable()
class Category {
  final String id;
  final String color;
  final Name name;
  final String key;
  Category({
    required this.id,
    required this.color,
    required this.name,
    required this.key
});
  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}