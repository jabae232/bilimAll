import 'package:json_annotation/json_annotation.dart';
part 'name.g.dart';

@JsonSerializable()
class Name {
  @JsonKey(name : "ru")
  final String ru;
  @JsonKey(name : "en")
  final String en;
  @JsonKey(name : "kz")
  final String kz;
  Name({
    required this.ru,
    required this.kz,
    required this.en
});
  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);
  Map<String, dynamic> toJson() => _$NameToJson(this);
}