import 'dart:ffi';

import 'package:bilim_all/screens/ui/featured_screen/featured_screen_model.dart';
import 'package:bilim_all/screens/ui/featured_screen/widgets/courses/course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_styles.dart';
import '../../../repositories/courses/courses_repo.dart';
import '../../../repositories/courses/models/courses.dart';


class FeaturedScreen extends StatefulWidget {
  const FeaturedScreen({Key? key}) : super(key: key);

  @override
  State<FeaturedScreen> createState() => _FeaturedScreenState();
}

class _FeaturedScreenState extends State<FeaturedScreen> {
  List<CoursesModel>? courses;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final model = FeaturedScreenModel();
    return FeaturedScreenModelProvider(
        model: model, child: _FeaturedScreenBody());
  }
}

class _FeaturedScreenBody extends StatelessWidget {
  _FeaturedScreenBody({Key? key}) : super(key: key);
  List<CoursesModel>? courses;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          FeaturedScreenModelProvider.read(context)?.model.getData();
          courses = await CoursesRepository().getCoursesList();
          print(courses?.length);
        },
        child: Icon(Icons.add),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              leading: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SvgPicture.asset(
                    AppAssets.svg.account,
                    width: 24,
                    height: 24,
                  )),
              title: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 19, horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                        'Добро пожаловать, ',
                        style: AppStyles.s14w600.copyWith(color: Colors.black),
                      ),
                      Text(
                        'Имя пользователя',
                        style: AppStyles.s14w600
                            .copyWith(color: AppColors.mainBlue),
                      ),
                    ],
                  )),
              elevation: 1,
              backgroundColor: AppColors.defaultBackground,
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: SingleChildScrollView(
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
                    Text('My Courses',
                        style: AppStyles.s16w600
                            .copyWith(color: AppColors.mainBlue)),
                    const SizedBox(
                      width: 35,
                    ),
                    Text(
                      'Popular',
                      style: AppStyles.s16w600,
                    ),
                  ],
                ),
                Courses(
                    image: AppAssets.images.courseExOne,
                    author: 'Rakhat Kanatov',
                    fieldOfCourse: 'Art & Design',
                    nameOfCourse: 'Become a product manager learn the skills & job',
                    numberOflessons: '43',
                    ratings: '4.5(44)',
                    isLiked: false),
                Courses(
                    image: AppAssets.images.courseExTwo,
                    author: 'Marya Eralanova',
                    fieldOfCourse: 'UX Design',
                    nameOfCourse: 'Fundamentals of music theory Learn new',
                    numberOflessons: '72',
                    ratings: '4.0(44)',isLiked: false,),
                Courses(
                    image: AppAssets.images.course,
                    author: 'Olzhas Ratbek',
                    fieldOfCourse: 'Development',
                    nameOfCourse: 'JavaScript from zero',
                    numberOflessons: '35',
                    ratings: '4.3(44)',
                isLiked: false,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
