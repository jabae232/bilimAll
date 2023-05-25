import 'package:bilim_all/src/features/ui/featured_screen/data/bloc/courses_bloc.dart';
import 'package:bilim_all/src/features/ui/featured_screen/ui/widgets/courses/course.dart';
import 'package:bilim_all/src/features/ui/featured_screen/ui/widgets/courses_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../constants/app_assets.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_styles.dart';
import '../../../../../repositories/courses/models/courses.dart';

class FeaturedScreen extends StatefulWidget {
  const FeaturedScreen({Key? key}) : super(key: key);

  @override
  State<FeaturedScreen> createState() => _FeaturedScreenState();
}

class _FeaturedScreenState extends State<FeaturedScreen> {
  @override
  Widget build(BuildContext context) {
    return _FeaturedScreenBody();
  }
}

class _FeaturedScreenBody extends StatelessWidget {
  const _FeaturedScreenBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoursesBloc, CoursesState>(
      builder: (context, state) {
        if (state is CoursesLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is CoursesErrorState) {
          return Center(
              child: ElevatedButton(
            onPressed: () {
              context.read<CoursesBloc>().add(GetCoursesEvent());
            },
            child: const Text('refresh'),
          ));
        }
        if (state is CoursesLoadedState) {
          return Scaffold(
            body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    leading: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SvgPicture.asset(
                          AppAssets.svg.account,
                          width: 24,
                          height: 24,
                        )),
                    elevation: 1,
                    backgroundColor: AppColors.defaultBackground,
                    title: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 19, horizontal: 10),
                        child: Row(
                          children: [
                            Text(
                              '${AppLocalizations.of(context)?.welcome}',
                              style: AppStyles.s14w600
                                  .copyWith(color: Colors.black),
                            ),
                            Expanded(
                              child: Text(
                                'Имя пользователя',maxLines: 3,
                                style: AppStyles.s14w600
                                    .copyWith(color: AppColors.mainBlue),
                              ),
                            ),
                          ],
                        )),
                  ),
                ];
              },
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        height: 1,
                        color: AppColors.loginField,
                      ),
                      Image(image: AssetImage(AppAssets.images.quote)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('${AppLocalizations.of(context)?.myCourses}',
                              style: AppStyles.s16w600
                                  .copyWith(color: AppColors.mainBlue)),
                          const SizedBox(
                            width: 35,
                          ),
                          Text(
                            '${AppLocalizations.of(context)?.popular}',
                            style: AppStyles.s16w600,
                          ),
                        ],
                      ),
                      CoursesList(
                        list: state.list,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        return const Center(child: Text('mistake'));
      },
    );
  }
}
