import 'package:bilim_all/src/features/api/api.dart';
import 'package:bilim_all/src/features/shared_pref/shared_pref.dart';
import 'package:bilim_all/src/features/ui/featured_screen/data/bloc/courses_bloc.dart';
import 'package:bilim_all/src/features/ui/featured_screen/data/repo/courses_repo.dart';
import 'package:bilim_all/src/features/ui/learning_screen/bloc/learning_bloc.dart';
import 'package:bilim_all/src/features/ui/learning_screen/repo/learning_repo.dart';
import 'package:bilim_all/src/features/ui/login_screen/data/bloc/login_bloc.dart';
import 'package:bilim_all/src/features/ui/login_screen/data/repo/login_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'l10n/l10n.dart';
import 'navigation/main_navigation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final reposetory = SharedPrefModel();
  await reposetory.init();
  var defaultLocale = const Locale('ru','RU');
  final locale = await reposetory.readLocale();
  if(locale == 'en') {
    defaultLocale = const Locale('en', 'EN');
  }if(locale == 'ru') {
    defaultLocale = const Locale('ru', 'RU');
  }if(locale == 'kk') {
    defaultLocale = const Locale('kk','KK');
  }
  runApp(DependenciesProvider(builder: (BuildContext context) {
    return MyApp(locale: defaultLocale,);
  }));
}

class MyApp extends StatefulWidget {
  static final mainNavigation = MainNavigation();
  MyApp({Key? key,required this.locale}) : super(key: key);
  Locale? locale;
  @override
  State<MyApp> createState() => _MyAppState();
  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  void setLocale(Locale value) {
    setState(() {
      widget.locale = value;
      SharedPrefModel().saveLocale(widget.locale!);
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MyApp.mainNavigation.initialRoute,
      routes: MyApp.mainNavigation.routes,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: widget.locale,
      supportedLocales: L10n.all,
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
        Provider(
            create: (context) => RepoCourses(
                  api: RepositoryProvider.of<Api>(context),
                )),
        Provider(
            create: (context) => RepoLogin(
                  api: RepositoryProvider.of<Api>(context),
                )),
        Provider(
            create: (context) => RepoLearning(
                  api: RepositoryProvider.of<Api>(context),
                )),
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
        BlocProvider(
          create: (context) => LoginBloc(
            repo: RepositoryProvider.of<RepoLogin>(context),
          ),
        ),
        BlocProvider(
          create: (context) => LearningBloc(
            repo: RepositoryProvider.of<RepoLearning>(context),
          )..add(GetBoughtCoursesEvent()),
        ),
      ],
      child: child,
    );
  }
}
