import 'package:bilim_all/repositories/courses/courses_repo.dart';
import 'package:flutter/material.dart';

import '../../../repositories/courses/models/courses.dart';

class FeaturedScreenModel extends ChangeNotifier {
  List<CoursesModel>? courses;
  void getData()async{
    courses = await CoursesRepository().getCoursesList();
  }
}

class FeaturedScreenModelProvider extends InheritedNotifier {
  FeaturedScreenModel model;
  FeaturedScreenModelProvider(
      {Key? key, required Widget child, required this.model})
      : super(key: key, notifier: model, child: child);

  static FeaturedScreenModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<FeaturedScreenModelProvider>();
  }

  static FeaturedScreenModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<FeaturedScreenModelProvider>()
        ?.widget;
    return widget is FeaturedScreenModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(FeaturedScreenModelProvider oldWidget) {
    return false;
  }
}
