import 'package:flutter/material.dart';

class SearchScreenModel extends ChangeNotifier {

}

class SearchScreenModelProvider extends InheritedNotifier {
  SearchScreenModel model;
  SearchScreenModelProvider(
      {Key? key, required Widget child, required this.model})
      : super(key: key, notifier: model, child: child);

  static SearchScreenModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SearchScreenModelProvider>();
  }

  static SearchScreenModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<SearchScreenModelProvider>()
        ?.widget;
    return widget is SearchScreenModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(SearchScreenModelProvider oldWidget) {
    return false;
  }
}
