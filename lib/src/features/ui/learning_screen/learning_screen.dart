
import 'package:bilim_all/src/features/ui/learning_screen/widgets/my_courses/my_course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/app_assets.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_styles.dart';
import 'learning_screen_model.dart';

class LearningScreen extends StatelessWidget {
  const LearningScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final model = LearningScreenModel();
    return LearningScreenModelProvider(model: model,child: const _LearningScreenBody(),);
  }
}

class _LearningScreenBody extends StatelessWidget {
  const _LearningScreenBody({Key? key}) : super(key: key);

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
              title: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 19, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Text('My learning', style: AppStyles.s20w500.copyWith(color: AppColors.mainBlue),)),
                  ],
                )
              ),
            ),
          ];
        },
        body: Column(
          children: [
            Container(height: 1,color: AppColors.loginField,),
            MyCourse(image: 'https://4lapy.ru/resize/1664x1000/upload/medialibrary/270/2703fd71a17c0843c0b91bbe28c4fe0f.jpg', authorName: 'Olzhas Ratpek', completion: '5% complete', courseName: 'JavaScript from zero'),
            MyCourse(image: 'https://4lapy.ru/resize/1664x1000/upload/medialibrary/270/2703fd71a17c0843c0b91bbe28c4fe0f.jpg', authorName: 'Olzhas Ratpek', completion: '5% complete', courseName: 'JavaScript from zero'),
            MyCourse(image: 'https://4lapy.ru/resize/1664x1000/upload/medialibrary/270/2703fd71a17c0843c0b91bbe28c4fe0f.jpg', authorName: 'Olzhas Ratpek', completion: '5% complete', courseName: 'JavaScript from zero'),
          ],
        ),
      ),
    );
  }
}

