import 'package:bilim_all/src/features/ui/featured_screen/ui/widgets/course_overview/widgets/course_video/check_video.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../constants/app_colors.dart';
import '../../../../../../../../../constants/app_styles.dart';
import 'course_videos_list.dart';

class CourseVideoSample extends StatelessWidget {
  const CourseVideoSample(
      {Key? key,
      required this.name,
      required this.isWatched,
      required this.index})
      : super(key: key);
  final String name;
  final bool isWatched;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: false, onChanged: (value) => () {}),
        Expanded(
            child: Text(
          name,
          style: AppStyles.s15w400
              .copyWith(color: AppColors.black, fontSize: 13),
          maxLines: 3,
        )),
      ],
    );
  }
}
