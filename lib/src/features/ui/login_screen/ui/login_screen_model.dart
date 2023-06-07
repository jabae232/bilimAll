import 'package:bilim_all/navigation/main_navigation.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../shared_pref/shared_pref.dart';
import '../data/dto/login.dart';

class LoginScreenModel extends ChangeNotifier {
  String _password = '';
  String _email = '';
  String? errorPas;
  String? errorEmail;
  var _visibility = false;
  set visibility(bool value) {
    _visibility = value;
    notifyListeners();
  }
  set password(String value) {
    if(value != null && value.trim().isNotEmpty) {
      errorPas = null;
      notifyListeners();
    }
    _password = value;
  }
  set email(String value) {
    if(value != null && value.trim().isNotEmpty) {
      errorEmail = null;
      notifyListeners();
    }
    _email = value;
  }

  void nextPage(context) async{
    print('$_email');
    print('$_password');
    print('here');
      final response = await Dio().post('https://rocky-fortress-84759.herokuapp.com/api/login',
          data: {"email": _email, "password": _password});
      print(response.data);
      if(response.statusCode == 200) {
        final modelSharedPref = SharedPrefModel();
        await modelSharedPref.loggedWrite('Y');
        final token = Login.fromJson(response.data);
        await SharedPrefModel().saveToken(token.uid);
        Navigator.of(context).pushNamed(MainNavigationRouteNames.mainNavBar);
      }

  }
}

class LoginScreenModelProvider extends InheritedNotifier {
  LoginScreenModel model;
  LoginScreenModelProvider(
      {Key? key, required Widget child, required this.model})
      : super(key: key, notifier: model, child: child);

  static LoginScreenModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<LoginScreenModelProvider>();
  }

  static LoginScreenModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<LoginScreenModelProvider>()
        ?.widget;
    return widget is LoginScreenModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(LoginScreenModelProvider oldWidget) {
    return false;
  }
}
