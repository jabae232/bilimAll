import 'package:bilim_all/constants/app_styles.dart';
import 'package:bilim_all/src/features/ui/featured_screen/data/dto/courses.dart';
import 'package:flutter/material.dart';
import '../../../../../../../constants/app_colors.dart';
import '../check_course/check_applied_course.dart';
import '../custom_line/progress_line.dart';


class MyCourse extends StatelessWidget {
  const MyCourse(
      {Key? key,
      required this.course,})
      : super(key: key);
  final Courses course;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AppliedCourse(
              videos: course.videoLessons,
            ))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
        child: Row(
          children: [
            Flexible(flex: 1,child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(1),
                child: Image.network(
                  course.imageUrl,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ),
            ),),
            const SizedBox(width: 16,),
            Flexible(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(course.name,style: AppStyles.s14w600.copyWith(color: Colors.black),),
                  Text(course.teachers.first.fullName!,style: AppStyles.s14w600.copyWith(color: AppColors.neutralTextColor),),
                const SizedBox(height: 10),
                ProgressLine(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
