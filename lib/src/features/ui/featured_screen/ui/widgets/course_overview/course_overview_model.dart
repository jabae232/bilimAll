import 'package:flutter/material.dart';

class CourseOverviewModel extends ChangeNotifier {

}

class CourseOverviewModelProvider extends InheritedNotifier {
  CourseOverviewModel model;
  CourseOverviewModelProvider(
      {Key? key, required Widget child, required this.model})
      : super(key: key, notifier: model, child: child);

  static CourseOverviewModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<CourseOverviewModelProvider>();
  }

  static CourseOverviewModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<CourseOverviewModelProvider>()
        ?.widget;
    return widget is CourseOverviewModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(CourseOverviewModelProvider oldWidget) {
    return false;
  }
}
