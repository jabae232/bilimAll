
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../featured_screen/data/dto/courses.dart';

class AppliedCourse extends StatefulWidget {
  const AppliedCourse({Key? key, required this.videos}) : super(key: key);
  final List<VideoLesson> videos;
  @override
  State<AppliedCourse> createState() => _AppliedCourseState();
}

class _AppliedCourseState extends State<AppliedCourse> {
  @override
  Widget build(BuildContext context) {
    final List<Videos> videosLinks = [];
    for (int i = 0; i < widget.videos.length; i++) {
      final int trueLinkStart = widget.videos[i].iframe.indexOf('https://');
      final int trueLinkFinish = widget.videos[i].iframe.indexOf('\" title');
      final trueLink =
          widget.videos[i].iframe.substring(trueLinkStart, trueLinkFinish);
      final name = widget.videos[i].name;
      videosLinks.add(Videos(link: trueLink, name: name));
      print(trueLink);
    }
    return _AppliedCourseBody(
      videos: videosLinks,
    );
  }
}

class _AppliedCourseBody extends StatefulWidget {
  const _AppliedCourseBody({Key? key, required this.videos}) : super(key: key);
  final List<Videos> videos;

  @override
  State<_AppliedCourseBody> createState() => _AppliedCourseBodyState();
}

class _AppliedCourseBodyState extends State<_AppliedCourseBody> {
  late YoutubePlayerController controller;
  @override
  void initState() {
    controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.videos[0].link)!,
        flags: const YoutubePlayerFlags(
            controlsVisibleAtStart: true,
            mute: false,
            loop: false,
            autoPlay: false,
        forceHD: false,
        disableDragSeek: false,
        ));
    super.initState();
  }
  var chosenIndex = 0;
  @override
  Widget build(BuildContext context) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  YoutubePlayerBuilder(
                    builder: (context, player) => player,
                    player: YoutubePlayer(
                      controller: controller,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: ListView.separated(
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: (){
                            controller.load(YoutubePlayer.convertUrlToId(widget.videos[index].link)!);
                            setState(() {
                              controller.pause();
                              controller.cue(YoutubePlayer.convertUrlToId(widget.videos[index].link)!);
                              chosenIndex = index;
                            });
                          } ,
                          child: Container(
                            color: chosenIndex == index? Colors.blue : Colors.transparent,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
                              child: Text('${widget.videos[index].name}'),
                            ),
                          ),
                        );
                      },
                      itemCount: widget.videos.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(
                          height: 0.1,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
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

