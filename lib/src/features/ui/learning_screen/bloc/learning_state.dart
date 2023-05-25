part of 'learning_bloc.dart';

@immutable
abstract class LearningState {}

class LearningInitial extends LearningState {}
class CoursesLoadingState extends LearningState{}
class CoursesLoadedState extends LearningState{
  final List<Courses> list;
  CoursesLoadedState({
    required this.list,
  });
}
class CoursesErrorState extends LearningState{
  final String errorMessage;
  CoursesErrorState({
    required this.errorMessage
  });
}