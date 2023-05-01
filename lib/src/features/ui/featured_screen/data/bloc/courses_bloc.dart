import 'dart:async';

import 'package:bilim_all/repositories/courses/courses_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../dto/courses.dart';
import '../repo/courses_repo.dart';

part 'courses_event.dart';
part 'courses_state.dart';

class CoursesBloc extends Bloc<CoursesEvent, CoursesState> {
  final RepoCourses repo;
  CoursesBloc({required this.repo}) : super(CoursesInitial()) {
    on<GetCoursesEvent>(_onGetCourses);
  }
  _onGetCourses(GetCoursesEvent event,Emitter<CoursesState> emit) async{
    emit(CoursesLoadingState());
    try{
      final coursesList = await repo.fetch();
      emit(CoursesLoadedState(list: coursesList));
    } catch(e){
      emit(CoursesErrorState(errorMessage:'${(e as DioError).message}'));
    }
  }
}
