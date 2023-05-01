
import 'package:flutter/material.dart';

import '../../data/dto/courses.dart';
import 'courses/course.dart';

class CoursesList extends StatelessWidget {
  const CoursesList({Key? key,required this.list}) : super(key: key);
  final List<Courses> list;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return CoursesTile(
            color: list[index].category.color,
            image: list[index].imageUrl,
            author: list[index].teachers.first,
            fieldOfCourse: list[index].category.name.en,
            nameOfCourse: list[index].name,
            numberOflessons: list[index].videoLessons.length.toString(),
            ratings: list[index].price.toString(), isLiked: false,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 0.1,
          );
        },
        itemCount: list.length,
    shrinkWrap: true,);
  }
}
