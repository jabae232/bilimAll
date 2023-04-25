// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoursesModel _$CoursesFromJson(Map<String, dynamic> json) => CoursesModel(
      id: json['id'] as String,
      videoLessons: (json['video_lessons'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      teachers:
          (json['teachers'] as List<dynamic>).map((e) => e as String).toList(),
      price: json['price'] as String,
      overview: json['overview'] as String,
      iframe: json['iframe'] as String,
      description: json['description'] as String,
      imageUrl: json['image_url'] as String,
      color: json['color'] as String,
      name: json['name'] as String,
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CoursesToJson(CoursesModel instance) => <String, dynamic>{
      'id': instance.id,
      'overview': instance.overview,
      'color': instance.color,
      'image_url': instance.imageUrl,
      'name': instance.name,
      'description': instance.description,
      'iframe': instance.iframe,
      'teachers': instance.teachers,
      'video_lessons': instance.videoLessons,
      'category': instance.category,
      'price': instance.price,
    };
