part of 'courses_bloc.dart';

@immutable
abstract class CoursesState {}

class CoursesInitial extends CoursesState {}
class CoursesLoadingState extends CoursesState{}
class CoursesLoadedState extends CoursesState{
  final List<Courses> list;
  CoursesLoadedState({
    required this.list,
});
}
class CoursesErrorState extends CoursesState{
  final String errorMessage;
  CoursesErrorState({
    required this.errorMessage
});
}