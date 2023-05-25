import 'package:bilim_all/src/features/ui/learning_screen/bloc/learning_bloc.dart';
import 'package:bilim_all/src/features/ui/learning_screen/ui/widgets/my_courses/my_course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../constants/app_assets.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_styles.dart';

class LearningScreen extends StatefulWidget {
  const LearningScreen({Key? key}) : super(key: key);

  @override
  State<LearningScreen> createState() => _LearningScreenState();
}

class _LearningScreenState extends State<LearningScreen> {
  @override
  Widget build(BuildContext context) {
    return const _LearningScreenBody();
  }
}

class _LearningScreenBody extends StatelessWidget {
  const _LearningScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LearningBloc, LearningState>(
      builder: (context, state) {
        if(state is CoursesLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is CoursesErrorState) {
          return Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<LearningBloc>().add(GetBoughtCoursesEvent());
                },
                child: const Text('refresh'),
              ));
        }
        if (state is CoursesLoadedState) {
          return Scaffold(
            backgroundColor: AppColors.defaultBackground,
            body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    actions: [
                      SvgPicture.asset(AppAssets.svg.search),
                      const SizedBox(
                        width: 10,
                      )
                    ],
                    elevation: 1,
                    backgroundColor: AppColors.defaultBackground,
                    title: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 19, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: Text(
                                  '${AppLocalizations.of(context)?.myLearning}',
                                  style: AppStyles.s20w500
                                      .copyWith(color: AppColors.mainBlue),
                                )),
                          ],
                        )),
                  ),
                ];
              },
              body: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return MyCourse(
                      course: state.list[index],
                    );
                  },
                  itemCount: state.list.length,
                  shrinkWrap: true,),
              )
            ),
          );
        };
        return const Center(child: Text('mistake'));
      },

    );
  }
}
