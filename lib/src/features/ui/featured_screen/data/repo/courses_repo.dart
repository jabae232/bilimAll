import 'dart:convert';

import 'package:bilim_all/src/features/shared_pref/shared_pref.dart';
import 'package:bilim_all/src/features/ui/featured_screen/data/dto/courses.dart';
import 'package:dio/dio.dart';

import '../../../../api/api.dart';
import '../../../account_screen/data/dto/account_dto.dart';


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
  Future<AccountDto> getAccount() async {
    final result = await api.dio.get(
      '/get-user-info/',
    );
    final AccountDto account = accountDtoFromJson(json.encode(result.data));
    return account;
  }
  Future<void> add(String id) async {
    final result = await api.dio.post(
        '/whishlist/add-course/',
        data: {"courseId":id}
    );
    print(result.data);
  }
}