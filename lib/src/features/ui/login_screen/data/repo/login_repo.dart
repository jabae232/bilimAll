import 'dart:convert';


import 'package:bilim_all/src/features/ui/login_screen/data/dto/login.dart';

import '../../../../api/api.dart';
import '../../../../shared_pref/shared_pref.dart';


class RepoLogin {
  RepoLogin({required this.api});

  final Api api;
  Future<void> login(String username,String password) async {
    print(username);
    print(password);
    final result = await api.dio.post(
      '/login/',data: {"email": username, "password": password}
    );
   final response = loginFromJson(json.encode(result.data));
   print(response.uid);
    await SharedPrefModel().tokenReset;
   await SharedPrefModel().saveToken(response.uid);
   print(await SharedPrefModel().getToken());
  }
}