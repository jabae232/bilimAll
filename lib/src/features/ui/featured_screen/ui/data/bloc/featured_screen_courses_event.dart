part of 'featured_screen_courses_bloc.dart';

@immutable
abstract class FeaturedScreenCoursesEvent {}
class GetCourses extends FeaturedScreenCoursesEvent{
  final bool side;
  GetCourses({
    required this.side
});
}