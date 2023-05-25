import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../featured_screen/data/dto/courses.dart';
import '../repo/learning_repo.dart';

part 'learning_event.dart';
part 'learning_state.dart';

class LearningBloc extends Bloc<LearningEvent, LearningState> {
  final RepoLearning repo;
  LearningBloc({required this.repo}) : super(LearningInitial()) {
    on<GetBoughtCoursesEvent>(_onGetCourses);
  }
  _onGetCourses(GetBoughtCoursesEvent event,Emitter<LearningState> emit) async{
    emit(CoursesLoadingState());
    try{
      var coursesList = await repo.fetch();
      emit(CoursesLoadedState(list: coursesList));
    } catch(e){
      emit(CoursesErrorState(errorMessage:'${e}'));
    }
  }
}


