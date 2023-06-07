import 'package:bilim_all/src/features/ui/account_screen/data/repo/account_repo.dart';
import 'package:bilim_all/src/features/ui/wishlist_screen/data/bloc/wishlist_screen_bloc.dart';
import 'package:bilim_all/src/features/ui/wishlist_screen/data/repo/wishlist_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../src/features/ui/account_screen/data/bloc/account_bloc.dart';
import '../src/features/ui/featured_screen/data/bloc/courses_bloc.dart';
import '../src/features/ui/featured_screen/data/repo/courses_repo.dart';
import '../src/features/ui/featured_screen/ui/data/bloc/featured_screen_courses_bloc.dart';
import '../src/features/ui/learning_screen/bloc/learning_bloc.dart';
import '../src/features/ui/learning_screen/repo/learning_repo.dart';
import '../src/features/ui/login_screen/data/bloc/login_bloc.dart';
import '../src/features/ui/login_screen/data/repo/login_repo.dart';

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
        BlocProvider(
          create: (context) => AccountBloc(
            repo: RepositoryProvider.of<RepoAccount>(context),
          )..add(GetAccountEvent()),
        ),
        BlocProvider(
          create: (context) => WishlistScreenBloc(
            repo: RepositoryProvider.of<RepoWishlist>(context),
          ),
        ),
        BlocProvider(
          create: (context) => FeaturedScreenCoursesBloc(
            repo: RepositoryProvider.of<RepoCourses>(context),
          ),
        ),
      ],
      child: child,
    );
  }
}