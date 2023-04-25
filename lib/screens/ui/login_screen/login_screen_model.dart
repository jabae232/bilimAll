import 'package:bilim_all/navigation/main_navigation.dart';
import 'package:flutter/material.dart';

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
  void nextPage(context) {
    bool _checker = false;
    if(_password.trim().length < 6) {
      _checker = true;
      errorPas = 'Password contains more than 6 characters';
      notifyListeners();
    }
    if(_email.trim().length < 6 || !_email.trim().contains("@")) {
      _checker = true;
      errorEmail = 'Enter your valid email';
      notifyListeners();
    }
    if(_checker) {
      return;
    } else {
      Navigator.of(context).pushNamed(MainNavigationRouteNames.mainNavBar);
    }
  }
  set password(String value) {
    if(value != null && value.trim().isNotEmpty) {
      errorPas = null;
      _password = value;
    }
  }
  set email(String value) {
    if(value != null && value.trim().isNotEmpty) {
      errorEmail = null;
      _email = value;
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
