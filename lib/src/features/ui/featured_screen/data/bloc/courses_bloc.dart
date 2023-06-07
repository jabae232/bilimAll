import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../dto/courses.dart';
import '../repo/courses_repo.dart';

part 'courses_event.dart';
part 'courses_state.dart';

class CoursesBloc extends Bloc<CoursesEvent, CoursesState> {
  final RepoCourses repo;
  CoursesBloc({required this.repo}) : super(CoursesInitial()) {
    on<GetCoursesEvent>(_onGetCourses);
    on<AddCourseEvent>(_onAddCourse);
  }
  _onGetCourses(GetCoursesEvent event,Emitter<CoursesState> emit) async{
    emit(CoursesLoadingState());
    try{
      final coursesList = await repo.fetch();
      final account = await repo.getAccount();
      emit(CoursesLoadedState(list: coursesList,fullName: account.fullName,liked: account.whishlist));
    } catch(e){
      emit(CoursesErrorState(errorMessage:'${e}'));
    }
  }
  _onAddCourse(AddCourseEvent event,Emitter<CoursesState> emitter) async {
    await repo.add(event.id);
    add(GetCoursesEvent());
  }
}
