import 'package:bilim_all/constants/app_assets.dart';
import 'package:bilim_all/constants/app_styles.dart';
import 'package:bilim_all/screens/ui/featured_screen/widgets/course_overview/course_overview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../constants/app_colors.dart';

class Courses extends StatelessWidget {
  const Courses(
      {Key? key,
      required this.image,
      required this.author,
      required this.fieldOfCourse,
      required this.nameOfCourse,
      required this.numberOflessons,
      required this.ratings,
      required this.isLiked})
      : super(key: key);
  final String image;
  final String numberOflessons;
  final String ratings;
  final String nameOfCourse;
  final String author;
  final String fieldOfCourse;
  final bool isLiked;
  void checkCourse(context,CourseOverviewConfig config) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CourseOverviewInfoScreen (config: config,),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final config = CourseOverviewConfig(
        image: image,
        author: author,
        fieldOfCourse: fieldOfCourse,
        nameOfCourse: nameOfCourse,
        numberOflessons: numberOflessons,
        ratings: ratings,
        isLiked: isLiked,
        briefOverview: ''
            "Only a quid me old mucker squiffy tomfoolery grub cheers ruddy cor blimey guvnor in my flat, up the duff Eaton car boot up the kyver pardon you A bit of how's your father David skive off sloshed, don't get shirty with me chip shop vagabond crikey bugger Queen's English chap. Matie boy nancy boy bite your arm off up the kyver old no biggie fantastic boot, David have it show off show off pick ");
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 18),
      child: InkWell(
        onTap: () => checkCourse(context, config),
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.line),
              borderRadius: BorderRadius.circular(30)),
          child: Stack(
            children: [
              Column(
                children: [
                  Image(image: AssetImage(image)),
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
                              '${numberOflessons} Lessons',
                              style: AppStyles.s16w600
                                  .copyWith(color: AppColors.neutralTextColor),
                            ),
                            const Expanded(child: SizedBox()),
                            Text(
                              ratings,
                              style: AppStyles.s16w600
                                  .copyWith(color: AppColors.neutralTextColor),
                            ),
                          ],
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              nameOfCourse,
                              style: AppStyles.s20w600.copyWith(color: AppColors.black),
                            )),
                        Row(
                          children: [
                            CircleAvatar(),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              author,
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
                                'Free',
                                style: AppStyles.s20w600
                                    .copyWith(color: AppColors.purple),
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
                    color: AppColors.purple,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    fieldOfCourse,
                    style: AppStyles.s14w600
                        .copyWith(color: AppColors.defaultBackground),
                  ),
                ),
              ),
              Positioned(
                right: 5,
                top: 5,
                child: InkWell(
                  child: isLiked ? SvgPicture.asset(AppAssets.svg.liked) : SvgPicture.asset(AppAssets.svg.unliked),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
