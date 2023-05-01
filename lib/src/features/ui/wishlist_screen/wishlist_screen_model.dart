import 'package:flutter/material.dart';

class WishlistScreenModel extends ChangeNotifier {

}

class WishlistScreenModelProvider extends InheritedNotifier {
  WishlistScreenModel model;
  WishlistScreenModelProvider(
      {Key? key, required Widget child, required this.model})
      : super(key: key, notifier: model, child: child);

  static WishlistScreenModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<WishlistScreenModelProvider>();
  }

  static WishlistScreenModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<WishlistScreenModelProvider>()
        ?.widget;
    return widget is WishlistScreenModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(WishlistScreenModelProvider oldWidget) {
    return false;
  }
}
