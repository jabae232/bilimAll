part of 'courses_bloc.dart';

@immutable
abstract class CoursesState {}

class CoursesInitial extends CoursesState {}
class CoursesLoadingState extends CoursesState{}
class CoursesLoadedState extends CoursesState{
  final List<Courses> list;
  final List<String> liked;
  final String fullName;
  CoursesLoadedState({
    required this.list,
    required this.fullName,
    required this.liked
});
}
class CoursesErrorState extends CoursesState{
  final String errorMessage;
  CoursesErrorState({
    required this.errorMessage
});
}