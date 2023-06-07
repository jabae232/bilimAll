import 'package:bilim_all/src/features/ui/wishlist_screen/data/dto/wishlist_dto.dart';
import 'package:flutter/material.dart';

import '../../../featured_screen/ui/widgets/course_overview/widgets/course_video/course_video.dart';

class VideosListWishlist extends StatelessWidget {
  const VideosListWishlist({Key? key,required this.list}) : super(key: key);
  final List<VideoLesson> list;
  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child : ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return CourseVideoSample(
              name: list[index].name,
              isWatched: false,
              index: index,
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              height: 0.1,
            );
          },
          itemCount: list.length,
          shrinkWrap: true,));
  }
}

class Videos {
  final String name;
  final String link;

  Videos({
    required this.link,
    required this.name,
  });
}