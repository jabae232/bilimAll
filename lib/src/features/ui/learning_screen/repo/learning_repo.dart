import 'package:dio/dio.dart';
import '../../../api/api.dart';
import '../../featured_screen/data/dto/courses.dart';

class RepoLearning {
  final Api api;
  RepoLearning({
    required this.api
});
  Future<List<Courses>> fetch() async {
    Response response;
    try{
      response = await api.dio.get('/courses/');
      final coursesList = (response.data as List).map((e) => Courses.fromJson(e)).toList();
      final List<Courses> learningList = [];
      for(int i = 0; i < coursesList.length; i++) {
        if(coursesList[i].isBought == true) {
          learningList.add(coursesList[i]);
          print(learningList.length);
        }
      }
      print(learningList.length);
      return learningList ?? [];
    }catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
