import 'package:bilim_all/dependency_provider/repository_provider.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'bloc_provider.dart';

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