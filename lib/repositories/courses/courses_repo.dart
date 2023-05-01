import 'package:dio/dio.dart';

import '../../src/features/ui/featured_screen/data/dto/courses.dart';

class CoursesRepository {
  Future<List<Courses>> getCoursesList() async {
    Response response;
    try{
      response = await Dio().get('https://rocky-fortress-84759.herokuapp.com/api/courses/');
        return (response.data as List).map((e) => Courses.fromJson(e)).toList() ?? [];
    }catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
