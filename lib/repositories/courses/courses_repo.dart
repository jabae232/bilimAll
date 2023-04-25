import 'package:dio/dio.dart';

import 'models/courses.dart';
class CoursesRepository {
  Future<List<CoursesModel>> getCoursesList() async {
    Response response;
    try{
      response = await Dio().get('https://rocky-fortress-84759.herokuapp.com/api/courses/');
        return (response.data as List).map((e) => CoursesModel.fromJson(e)).toList() ?? [];
    }catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
