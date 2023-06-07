import 'package:bilim_all/constants/app_assets.dart';
import 'package:bilim_all/constants/app_styles.dart';
import 'package:bilim_all/src/features/ui/featured_screen/data/dto/courses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../../../../../constants/app_colors.dart';


class CoursesOverViewTile extends StatelessWidget {
  const CoursesOverViewTile(
      {Key? key,
        required this.course})
      : super(key: key);
  final Courses course;


  @override
  Widget build(BuildContext context) {
    var colors = '0xFF${course.category.color.replaceAll('#', '')}';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 18),
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
                            '${course.videoLessons.length} ${AppLocalizations.of(context)?.lessons}',
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
                              course.price == 0 ? '${AppLocalizations.of(context)?.free}' : course.price.toString(),
                              style: AppStyles.s20w600
                                  .copyWith(color: Color(int.parse(colors))),
                            ),
                            const Expanded(child: SizedBox()),
                            Text(
                              '${AppLocalizations.of(context)?.applyCourse}',
                              style: AppStyles.s20w600.copyWith(color: AppColors.mainBlue,
                                  decoration: TextDecoration. underline,decorationColor: AppColors.mainBlue),
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
                  child: course.isBought
                      ? SvgPicture.asset(AppAssets.svg.liked)
                      : SvgPicture.asset(AppAssets.svg.unliked),
                )),
          ],
        ),
      ),
    );
  }
}
