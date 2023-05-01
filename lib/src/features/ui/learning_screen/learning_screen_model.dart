import 'package:flutter/material.dart';

class LearningScreenModel extends ChangeNotifier {

}

class LearningScreenModelProvider extends InheritedNotifier {
  LearningScreenModel model;
  LearningScreenModelProvider(
      {Key? key, required Widget child, required this.model})
      : super(key: key, notifier: model, child: child);

  static LearningScreenModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<LearningScreenModelProvider>();
  }

  static LearningScreenModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<LearningScreenModelProvider>()
        ?.widget;
    return widget is LearningScreenModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(LearningScreenModelProvider oldWidget) {
    return false;
  }
}
