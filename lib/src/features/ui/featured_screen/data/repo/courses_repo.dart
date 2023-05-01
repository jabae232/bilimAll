import 'dart:convert';

import 'package:bilim_all/src/features/ui/featured_screen/data/dto/courses.dart';

import '../../../../api/api.dart';


class RepoCourses {
  RepoCourses({required this.api});

  final Api api;

  Future<List<Courses>> fetch() async {
    final result = await api.dio.get(
      '/courses/',
    );
    List<Courses> listCourses = coursesFromJson(json.encode(result.data));

    return listCourses;
  }
}