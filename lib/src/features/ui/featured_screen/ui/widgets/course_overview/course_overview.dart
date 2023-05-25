import 'package:bilim_all/src/features/ui/featured_screen/ui/widgets/course_overview/widgets/course_overview_tile/course_overview_tile_widget.dart';
import 'package:bilim_all/src/features/ui/featured_screen/ui/widgets/course_overview/widgets/course_video/course_videos_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../../../constants/app_assets.dart';
import '../../../../../../../constants/app_colors.dart';
import '../../../../../../../constants/app_styles.dart';
import '../../../data/dto/courses.dart';
import 'course_overview_model.dart';
class CourseOverviewInfoScreen extends StatefulWidget {
  const CourseOverviewInfoScreen({Key? key, required this.course})
      : super(key: key);
  final Courses course;
  @override
  State<CourseOverviewInfoScreen> createState() =>
      _CourseOverviewInfoScreenState();
}

class _CourseOverviewInfoScreenState extends State<CourseOverviewInfoScreen> {
  @override
  Widget build(BuildContext context) {
    final model = CourseOverviewModel();
    return CourseOverviewModelProvider(
        model: model,
        child: _CourseOverviewInfoScreenBody(
          course: widget.course,
        ));
  }
}

class _CourseOverviewInfoScreenBody extends StatelessWidget {
  const _CourseOverviewInfoScreenBody({Key? key, required this.course})
      : super(key: key);
  final Courses course;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                actions: [
                  SvgPicture.asset(
                    AppAssets.svg.search,
                    color: AppColors.mainBlue,
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
                leading: const BackButton(
                  color: AppColors.mainBlue,
                ),
                elevation: 1,
                backgroundColor: AppColors.defaultBackground,
                title: Center(
                    child: Text(
                  '${AppLocalizations.of(context)?.courseOverview}',
                  style: AppStyles.s20w500.copyWith(color: AppColors.mainBlue),
                )),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Column(
              children: [
                CoursesOverViewTile(
                  course: course,
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 31, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${AppLocalizations.of(context)?.courseOverview}',
                        style:
                            AppStyles.s26w700.copyWith(color: AppColors.black),
                      ),
                      Text(
                        course.description,
                        style:
                            AppStyles.s18w400.copyWith(color: AppColors.black),
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Text(
                        course.name,
                        style: AppStyles.s16w600
                            .copyWith(color: AppColors.black, fontSize: 11),
                      ),
                      Text(
                        course.teachers.first.fullName,
                        style: AppStyles.s12w400.copyWith(
                            color: AppColors.authorNeutralTextColor,
                            fontSize: 11),
                      ),
                  VideosList(list: course.videoLessons),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
