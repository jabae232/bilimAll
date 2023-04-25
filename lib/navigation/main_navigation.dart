
import 'package:bilim_all/screens/ui/bottom_navigation_bar/bottom_nav_bar.dart';
import 'package:bilim_all/screens/ui/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

class MainNavigationRouteNames {
  static const String loginPage = '/';
  static const String mainNavBar = '/navbar';
}

class MainNavigation {
  final initialRoute = MainNavigationRouteNames.loginPage;
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.loginPage: (context) => const LoginScreen(),
    MainNavigationRouteNames.mainNavBar: (context) => const BottomNavBar(),
  };
}
/*class MainNavigationPush {
  Route<RegistrationPage> registration = MaterialPageRoute(builder: (context) => const RegistrationPage());
  Route<ConfirmationPage> confirmation = MaterialPageRoute(builder: (context) => const ConfirmationPage());
  Route<InformationPage> information = MaterialPageRoute(builder: (context) => const InformationPage());
  Route<InformationPage> ownProfile = MaterialPageRoute(builder: (context) => const OwnProfileWidget());
  Route<PasswordScreen> security = MaterialPageRoute(builder: (context) => const PasswordScreen());
  Route<PasswordScreen> stories = MaterialPageRoute(builder: (context) => CheckStoryWidget());
  Route<PasswordScreen> createPostWidget = MaterialPageRoute(builder: (context) => const CreatePostWidgetProfile());
}*/
