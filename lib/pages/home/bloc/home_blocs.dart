import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_course_example/pages/home/bloc/home_events.dart';
import 'package:u_course_example/pages/home/bloc/home_states.dart';

class HomeBlocs extends Bloc<HomeEvents, HomeStates> {
  HomeBlocs() : super(HomeStates()) {
    on<HomeDots>(_homeDots);
    on<HomeCourseItem>(_homeCourseItem);
  }

  void _homeDots(HomeDots event, Emitter<HomeStates> emit) {
    emit(state.copyWith(index: event.index));
  }

  void _homeCourseItem(HomeCourseItem event, Emitter<HomeStates> emit) {
    emit(state.copyWith(courseItems: event.courseItems));
  }
}
