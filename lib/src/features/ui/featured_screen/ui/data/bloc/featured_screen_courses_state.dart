part of 'featured_screen_courses_bloc.dart';

@immutable
abstract class FeaturedScreenCoursesState {}

class FeaturedScreenCoursesInitial extends FeaturedScreenCoursesState {}
class FeaturedScreenCoursesLoading extends FeaturedScreenCoursesState {}
class FeaturedScreenCoursesLoaded extends FeaturedScreenCoursesState {
  final List<Courses> courseList;
  final List<String> liked;
  FeaturedScreenCoursesLoaded({
    required this.courseList,
    required this.liked
});
}
class FeaturedScreenCoursesError extends FeaturedScreenCoursesState {}
