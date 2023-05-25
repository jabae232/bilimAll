
import 'package:flutter/material.dart';

import '../../data/dto/courses.dart';
import 'courses/course.dart';

class CoursesList extends StatelessWidget {
  const CoursesList({Key? key,required this.list}) : super(key: key);
  final List<Courses> list;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return CoursesTile(
        course: list[index],
          );
        },
        itemCount: list.length,
    shrinkWrap: true,);
  }
}
