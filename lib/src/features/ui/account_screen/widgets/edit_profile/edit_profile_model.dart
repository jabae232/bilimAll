import 'package:flutter/material.dart';

class EditProfileModel extends ChangeNotifier {

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
