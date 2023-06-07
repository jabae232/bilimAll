import 'dart:async';

import 'package:bilim_all/src/features/ui/featured_screen/data/dto/courses.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repo/courses_repo.dart';

part 'featured_screen_courses_event.dart';
part 'featured_screen_courses_state.dart';

class FeaturedScreenCoursesBloc extends Bloc<FeaturedScreenCoursesEvent, FeaturedScreenCoursesState> {
  final RepoCourses repo;
  FeaturedScreenCoursesBloc({required this.repo}) : super(FeaturedScreenCoursesInitial()) {
    on<GetCourses>(_onGetCourses);
  }
  _onGetCourses(GetCourses event,Emitter<FeaturedScreenCoursesState> emit) async{
    emit(FeaturedScreenCoursesLoading());
    final List<Courses> courseList = [];
    final courses = await repo.fetch();
    final account = await repo.getAccount();
    if(event.side) {
      for(int i = 0; i < courses.length; i++) {
        if(courses[i].isBought == false) {
          courseList.add(courses[i]);
        }
      }
      emit(FeaturedScreenCoursesLoaded(courseList: courseList,liked: account.whishlist));
    } else {
      for(int i = 0; i < courses.length; i++) {
        if(courses[i].isBought == true) {
          courseList.add(courses[i]);
        }
      }
      emit(FeaturedScreenCoursesLoaded(courseList: courseList,liked: account.whishlist));
    }
  }
}
