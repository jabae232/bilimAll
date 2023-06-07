import 'package:bilim_all/src/features/ui/account_screen/data/repo/account_repo.dart';
import 'package:bilim_all/src/features/ui/wishlist_screen/data/repo/wishlist_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../src/features/api/api.dart';
import '../src/features/ui/featured_screen/data/repo/courses_repo.dart';
import '../src/features/ui/learning_screen/repo/learning_repo.dart';
import '../src/features/ui/login_screen/data/repo/login_repo.dart';


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
        Provider(
            create: (context) => RepoAccount(
              api: RepositoryProvider.of<Api>(context),
            )),
        Provider(
            create: (context) => RepoWishlist(
              api: RepositoryProvider.of<Api>(context),
            )),
      ],
      child: child,
    );
  }
}