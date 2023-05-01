import 'package:bilim_all/src/features/api/api.dart';
import 'package:bilim_all/src/features/ui/featured_screen/data/bloc/courses_bloc.dart';
import 'package:bilim_all/src/features/ui/featured_screen/data/repo/courses_repo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'navigation/main_navigation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(DependenciesProvider(builder: (BuildContext context) {
    return MyApp();
  }));
}

class MyApp extends StatefulWidget {
  static final mainNavigation = MainNavigation();
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MyApp.mainNavigation.initialRoute,
      routes: MyApp.mainNavigation.routes,
    );
  }
}

class DependenciesProvider extends StatelessWidget {
  const DependenciesProvider({super.key, required this.builder});

  final Widget Function(BuildContext context) builder;

  @override
  Widget build(BuildContext context) {
    return ReposProvider(
      child: BlocsProvider(
        child: Builder(builder: builder),
      ),
    );
  }
}

class ReposProvider extends StatelessWidget {
  const ReposProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        RepositoryProvider(
          create: (context) => Api(),
        ),
        /*   Provider(
          create: (context) => RepoAdmin(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),*/
        Provider(create: (context) => RepoCourses(
          api: RepositoryProvider.of<Api>(context),
        ))
      ],
      child: child,
    );
  }
}

class BlocsProvider extends StatelessWidget {
  const BlocsProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CoursesBloc(
            repo: RepositoryProvider.of<RepoCourses>(context),
          )..add(GetCoursesEvent()),
        ),
      ],
      child: child,
    );
  }
}
