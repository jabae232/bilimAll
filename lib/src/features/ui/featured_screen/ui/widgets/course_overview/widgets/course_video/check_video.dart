import 'package:bilim_all/navigation/main_navigation.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'course_videos_list.dart';

class CheckLessonVideos extends StatefulWidget {
  const CheckLessonVideos(
      {Key? key,
      required this.index,
      required this.links})
      : super(key: key);
  final int index;
  final List<Videos> links;
  @override
  State<CheckLessonVideos> createState() => _CheckLessonVideosState();
}

class _CheckLessonVideosState extends State<CheckLessonVideos> {
  late YoutubePlayerController controller;
  @override
  Widget build(BuildContext context) {
    final url = widget.links[widget.index].link;
    controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(url)!,
        flags: const YoutubePlayerFlags(
            controlsVisibleAtStart: true,
            mute: false,
            loop: true,
            autoPlay: true));
    return YoutubePlayerBuilder(
      builder: (context, player) => Scaffold(
        body: ListView(
          children: [
            player,
            const SizedBox(
              height: 10,
            ),
            Center(child: Text(widget.links[widget.index].name)),
            Row(
              children: [
                ElevatedButton(
                    onPressed: widget.index == 0
                        ? null
                        : () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CheckLessonVideos(
                                      index: widget.index - 1,
                                      links: widget.links,
                                    ))),
                    child: Text("Previous course")),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                    onPressed: widget.index == widget.links.length - 1
                        ? null
                        : () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CheckLessonVideos(
                                      index: widget.index + 1,
                                      links: widget.links,
                                    ))),
                    child: Text("Next course")),
                ElevatedButton(
                    onPressed: () => Navigator.popUntil(context, ModalRoute.withName(MainNavigationRouteNames.mainNavBar)),
                    child: Text("back")),
              ],
            )
          ],
        ),
      ),
      player: YoutubePlayer(
        controller: controller,
      ),
    );
  }
}
