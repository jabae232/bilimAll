import 'package:bilim_all/screens/ui/account_screen/widgets/edit_profile/edit_profile.dart';
import 'package:flutter/material.dart';

class AccountScreenModel extends ChangeNotifier {
  void editProfile(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EditProfile (),
      ),
    );
  }

}

class AccountScreenModelProvider extends InheritedNotifier {
  AccountScreenModel model;
  AccountScreenModelProvider(
      {Key? key, required Widget child, required this.model})
      : super(key: key, notifier: model, child: child);

  static AccountScreenModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<AccountScreenModelProvider>();
  }

  static AccountScreenModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<AccountScreenModelProvider>()
        ?.widget;
    return widget is AccountScreenModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(AccountScreenModelProvider oldWidget) {
    return false;
  }
}
