import 'dart:convert';

import 'package:bilim_all/src/features/shared_pref/shared_pref.dart';
import 'package:bilim_all/src/features/ui/featured_screen/data/dto/courses.dart';
import 'package:dio/dio.dart';

import '../../../../api/api.dart';


class RepoCourses {
  RepoCourses({required this.api});

  final Api api;
  Future<List<Courses>> fetch() async {
    print('nammmmmmmmmmm');
    final result = await api.dio.get(
      '/courses/',
    );
    List<Courses> listCourses = coursesFromJson(json.encode(result.data));
    print(listCourses.map((e) => '${e.teachers}'));
    print(listCourses[0].teachers.first.fullName);
    print('nammmmmmmmmmm');
    print(listCourses.first.name);
    return listCourses;
  }
}