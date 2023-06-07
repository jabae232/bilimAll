import 'package:flutter/material.dart';

import '../../../../../../../navigation/main_navigation.dart';
import '../../../../../shared_pref/shared_pref.dart';

class EditProfileModel extends ChangeNotifier {
  Future<void> leave(context) async {
    final model = SharedPrefModel();
    if(await model.loggedRead() == 'Y') {
      await model.loggedWrite('N');
      await model.tokenReset();
      Navigator.of(context).pushReplacementNamed(MainNavigationRouteNames.loginPage);
    } else {
      Navigator.of(context).pushReplacementNamed(MainNavigationRouteNames.loginPage);
    }
  }
}

class EditProfileModelProvider extends InheritedNotifier {
  EditProfileModel model;
  EditProfileModelProvider(
      {Key? key, required Widget child, required this.model})
      : super(key: key, notifier: model, child: child);

  static EditProfileModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<EditProfileModelProvider>();
  }

  static EditProfileModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<EditProfileModelProvider>()
        ?.widget;
    return widget is EditProfileModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(EditProfileModelProvider oldWidget) {
    return false;
  }
}
