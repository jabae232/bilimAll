import 'package:bilim_all/screens/ui/wishlist_screen/wishlist_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_styles.dart';
import '../featured_screen/widgets/courses/course.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    final model = WishlistScreenModel();
    return WishlistScreenModelProvider(model: model, child: const _WishlistScreenBody());
  }
}

class _WishlistScreenBody extends StatelessWidget {
  const _WishlistScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultBackground,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              actions: [
                SvgPicture.asset(AppAssets.svg.search),
                const SizedBox(width: 10,)
              ],
              elevation: 1,
              backgroundColor: AppColors.defaultBackground,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.zero,
                centerTitle: true,
                title: Text('Wishlist',style: AppStyles.s20w500.copyWith(color: AppColors.mainBlue),),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
            child:Column(
              children: [
                Courses(
                    image: AppAssets.images.courseExOne,
                    author: 'Rakhat Kanatov',
                    fieldOfCourse: 'Art & Design',
                    nameOfCourse: 'Become a product manager learn the skills & job',
                    numberOflessons: '43',
                    ratings: '4.5(44)',isLiked: true),
                Courses(
                    image: AppAssets.images.courseExTwo,
                    author: 'Marya Eralanova',
                    fieldOfCourse: 'UX Design',
                    nameOfCourse: 'Fundamentals of music theory Learn new',
                    numberOflessons: '72',
                    ratings: '4.0(44)',isLiked: true),
                Courses(
                    image: AppAssets.images.course,
                    author: 'Olzhas Ratbek',
                    fieldOfCourse: 'Development',
                    nameOfCourse: 'JavaScript from zero',
                    numberOflessons: '35',
                    ratings: '4.3(44)',isLiked: true),
              ],
            ),
        ),
      ),
    );
  }
}
