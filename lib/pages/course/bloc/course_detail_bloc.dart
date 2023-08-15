import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_course_example/pages/course/bloc/course_detail_event.dart';
import 'package:u_course_example/pages/course/bloc/course_detail_states.dart';

class CourseDetailBloc extends Bloc<CourseDetailEvent, CourseDetailStates> {
  CourseDetailBloc() : super(const CourseDetailStates()) {
    on<TriggerCourseDetail>(_triggerCourseDetail);
  }

  _triggerCourseDetail(
      TriggerCourseDetail event, Emitter<CourseDetailStates> emit) {
    emit(state.copyWith(courseItem: event.courseItem));
  }
}
