
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../constants/app_assets.dart';
import '../../../../../../../constants/app_colors.dart';
import '../../../../../../../constants/app_styles.dart';
import '../courses/course.dart';
import 'course_overview_model.dart';


class CourseOverviewInfoScreen extends StatefulWidget {
  const CourseOverviewInfoScreen({Key? key,required this.config}) : super(key: key);
  final CourseOverviewConfig config;
  @override
  State<CourseOverviewInfoScreen> createState() => _CourseOverviewInfoScreenState();
}

class _CourseOverviewInfoScreenState extends State<CourseOverviewInfoScreen> {
  @override
  Widget build(BuildContext context) {
    final model = CourseOverviewModel();
    return CourseOverviewModelProvider(model: model, child: _CourseOverviewInfoScreenBody(config: widget.config,));
  }
}

class _CourseOverviewInfoScreenBody extends StatelessWidget {
  const _CourseOverviewInfoScreenBody({Key? key,required this.config}) : super(key: key);
  final CourseOverviewConfig config;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              actions: [
                SvgPicture.asset(AppAssets.svg.search,color: AppColors.mainBlue,width: 24,height: 24,),
                const SizedBox(width: 10,),
              ],
              leading: const BackButton(
                color: AppColors.mainBlue,
              ),
              elevation: 1,
              backgroundColor: AppColors.defaultBackground,
              title: Center(child: Text('Course Overview',style: AppStyles.s20w500.copyWith(color: AppColors.mainBlue),)),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              CoursesTile(
                  color: 'd',
                  image: config.image,
                  author: config.author,
                  fieldOfCourse: config.fieldOfCourse,
                  nameOfCourse: config.nameOfCourse,
                  numberOflessons: config.numberOflessons,
                  ratings: config.ratings,
              isLiked: config.isLiked,),
              const SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(left: 31,right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Course Overview',style: AppStyles.s26w700.copyWith(color: AppColors.black),),
                    Text(config.briefOverview,
                      style: AppStyles.s18w400.copyWith(color: AppColors.black),),
                    const SizedBox(height: 22,),
                    Text(config.nameOfCourse,style: AppStyles.s16w600.copyWith(color: AppColors.black,fontSize: 11),),
                    Text(config.author,style: AppStyles.s12w400.copyWith(color: AppColors.authorNeutralTextColor,fontSize: 11),),
                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
class CourseOverviewConfig {
final String image;
final String author;
final String fieldOfCourse;
final String nameOfCourse;
final String numberOflessons;
final String ratings;
final String briefOverview;
final bool isLiked;
 CourseOverviewConfig({
  required this.image,
   required this.author,
   required this.fieldOfCourse,
   required this.nameOfCourse,
   required this.numberOflessons,
   required this.ratings,
   required this.briefOverview,
   required this.isLiked,
});
}
