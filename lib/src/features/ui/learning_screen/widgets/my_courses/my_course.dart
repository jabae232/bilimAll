import 'package:bilim_all/constants/app_assets.dart';
import 'package:bilim_all/constants/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../../constants/app_colors.dart';


class MyCourse extends StatelessWidget {
  const MyCourse(
      {Key? key,
      required this.image,
      required this.authorName,
      required this.completion,
      required this.courseName})
      : super(key: key);
  final String image;
  final String courseName;
  final String authorName;
  final String completion;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 15),
      child: Row(
        children: [
          Flexible(flex: 1,child: Image(image: AssetImage(image)),),
          const SizedBox(width: 16,),
          Flexible(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(courseName,style: AppStyles.s14w600.copyWith(color: Colors.black),),
                Text(authorName,style: AppStyles.s14w600.copyWith(color: AppColors.neutralTextColor),),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Container(height: 2,color: AppColors.mainBlue,)),
                Text(completion,style: AppStyles.s8w500.copyWith(color: AppColors.neutralTextColor),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
