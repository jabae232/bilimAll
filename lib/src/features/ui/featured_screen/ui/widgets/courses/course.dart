import 'package:bilim_all/constants/app_assets.dart';
import 'package:bilim_all/constants/app_styles.dart';
import 'package:bilim_all/src/features/ui/featured_screen/data/bloc/courses_bloc.dart';
import 'package:bilim_all/src/features/ui/featured_screen/data/dto/courses.dart';
import 'package:bilim_all/src/features/ui/wishlist_screen/data/bloc/wishlist_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../constants/app_colors.dart';
import '../course_overview/course_overview.dart';

class CoursesTile extends StatelessWidget {
  const CoursesTile(
      {Key? key,
required this.course})
      : super(key: key);
  final Courses course;
  void checkCourse(context, Courses course) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CourseOverviewInfoScreen(
          course: course,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var colors = '0xFF${course.category.color.replaceAll('#', '')}';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 18),
      child: InkWell(
        onTap: () => checkCourse(context, course),
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.line),
              borderRadius: BorderRadius.circular(30)),
          child: Stack(
            children: [
              Column(
                children: [
                  Image.network(
                    course.imageUrl,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return const CircularProgressIndicator();
                    },
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${course.videoLessons.length} Lessons',
                              style: AppStyles.s16w600
                                  .copyWith(color: AppColors.neutralTextColor),
                            ),
                            const Expanded(child: SizedBox()),
                          ],
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              course.name,
                              style: AppStyles.s20w600
                                  .copyWith(color: AppColors.black),
                            )),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage("${course.teachers.first.avatar}"),
                              backgroundColor: Colors.transparent,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              course.teachers.first.fullName!,
                              style: AppStyles.s16w500.copyWith(
                                  color: AppColors.authorNeutralTextColor),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 1,
                          color: AppColors.line,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          child: Row(
                            children: [
                              Text(
                                course.price == 0 ? 'Free' : course.price.toString(),
                                style: AppStyles.s20w600
                                    .copyWith(color: Color(int.parse(colors))),
                              ),
                              const Expanded(child: SizedBox()),
                              Text(
                                'Know Details',
                                style: AppStyles.s20w600,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 20,
                left: 20,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Color(int.parse(colors)),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    course.category.name.en,
                    style: AppStyles.s14w600
                        .copyWith(color: AppColors.defaultBackground),
                  ),
                ),
              ),
              Positioned(
                  right: 5,
                  top: 5,
                  child: InkWell(
                    onTap: () async {
                      context.read<CoursesBloc>().add(AddCourseEvent(id: course.id));
                      context.read<WishlistScreenBloc>().add(GetWishlistEvent());
                    },
                    child: SvgPicture.asset(AppAssets.svg.unliked),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
