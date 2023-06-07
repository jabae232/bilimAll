part of 'courses_bloc.dart';

@immutable
abstract class CoursesEvent {}
class GetCoursesEvent extends CoursesEvent{}
class AddCourseEvent extends CoursesEvent{
  final String id;
  AddCourseEvent({
    required this.id
});
}