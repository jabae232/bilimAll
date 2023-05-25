import 'package:bilim_all/src/features/ui/account_screen/account_screen.dart';
import 'package:bilim_all/src/features/ui/learning_screen/ui/learning_screen.dart';
import 'package:bilim_all/src/features/ui/search_screen/search_screen.dart';
import 'package:bilim_all/src/features/ui/wishlist_screen/wishlist_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../constants/app_assets.dart';
import '../../../../constants/app_colors.dart';
import '../featured_screen/ui/featured_screen.dart';

class ProvidedStylesExample extends StatefulWidget {
  const ProvidedStylesExample({
    Key? key,
  }) : super(key: key);

  @override
  _ProvidedStylesExampleState createState() => _ProvidedStylesExampleState();
}

class _ProvidedStylesExampleState extends State<ProvidedStylesExample> {
  late PersistentTabController _controller;
  late bool _hideNavBar;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController();
    _hideNavBar = false;
  }

  List<Widget> _buildScreens() {
    return const [
      FeaturedScreen(),
      SearchScreen(),
      LearningScreen(),
      WishlistScreen(),
      AccountScreen(),
    ];
  }
  final color = Colors.cyan;
  List<PersistentBottomNavBarItem> _navBarsItems() => [
        PersistentBottomNavBarItem(
            icon:
                SvgPicture.asset(AppAssets.svg.featured, width: 25, height: 25),
            title: "${AppLocalizations.of(context)?.featured}",
            activeColorPrimary: color,
            activeColorSecondary: Colors.white,
            inactiveColorPrimary: Colors.red,
            inactiveColorSecondary: Colors.purple),
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset(AppAssets.svg.search, width: 25, height: 25,color: const Color(0xFFE93E30),),
          title: "${AppLocalizations.of(context)?.search}",
          activeColorPrimary: color,
          activeColorSecondary: Colors.white,
          inactiveColorPrimary: Colors.grey,
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: "/",
            routes: {
              "/first": (final context) => const FeaturedScreen(),
              "/second": (final context) => const SearchScreen(),
            },
          ),
        ),
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset(AppAssets.svg.learning, width: 25, height: 25,color: const Color(0xFFE93E30)),
          title: "${AppLocalizations.of(context)?.myLearning}",
          activeColorPrimary: color,
          activeColorSecondary: Colors.white,
          inactiveColorPrimary: Colors.grey,
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: "/",
            routes: {
              "/first": (final context) => const SearchScreen(),
              "/second": (final context) => const LearningScreen(),
            },
          ),
        ),
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset(AppAssets.svg.wishlist, width: 25, height: 25,color: const Color(0xFFE93E30)),
          title: "${AppLocalizations.of(context)?.wishlist}",
          activeColorPrimary: color,
          activeColorSecondary: Colors.white,
          inactiveColorPrimary: Colors.grey,
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: "/",
            routes: {
              "/first": (final context) => const LearningScreen(),
              "/second": (final context) => const WishlistScreen(),
            },
          ),
        ),
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset(AppAssets.svg.account, width: 25, height: 25,color: const Color(0xFFE93E30)),
          title: "${AppLocalizations.of(context)?.account}",
          activeColorPrimary: color,
          activeColorSecondary: Colors.white,
          inactiveColorPrimary: Colors.grey,
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: "/",
            routes: {
              "/first": (final context) => const WishlistScreen(),
              "/second": (final context) => const AccountScreen(),
            },
          ),
        ),
      ];

  @override
  Widget build(final BuildContext context) => Scaffold(
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          resizeToAvoidBottomInset: true,
          navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
              ? 0.0
              : kBottomNavigationBarHeight,
          bottomScreenMargin: 0,
          selectedTabScreenContext: (final context) {
            var testContext = context;
          },
          backgroundColor: Colors.white,
          hideNavigationBar: _hideNavBar,
          decoration: const NavBarDecoration(colorBehindNavBar: Colors.indigo),
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
          ),
          navBarStyle:
              NavBarStyle.style7, // Choose the nav bar style with this property
        ),
      );
}
