import 'package:bilim_all/src/features/ui/featured_screen/data/dto/courses.dart';
import 'package:flutter/material.dart';
import 'course_video.dart';

class VideosList extends StatelessWidget {
  const VideosList({Key? key,required this.list}) : super(key: key);
  final List<VideoLesson> list;
  @override
  Widget build(BuildContext context) {
    final List<Videos> videosLinks = [];
    for(int i = 0; i < list.length; i++) {
      final int trueLinkStart = list[i].iframe.indexOf('https://');
      final int trueLinkFinish = list[i].iframe.indexOf('\" title');
      final trueLink = list[i].iframe.substring(trueLinkStart, trueLinkFinish);
      final name = list[i].name;
      videosLinks.add(Videos(link: trueLink, name: name));
      print(trueLink);
    }
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child : ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return CourseVideoSample(
          name: list[index].name,
          isWatched: false,
          links: videosLinks,
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