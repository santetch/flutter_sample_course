import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_course_example/app_events.dart';
import 'package:u_course_example/app_states.dart';

class AppBlocs extends Bloc<AppEvents, AppStates> {
  AppBlocs() : super(InitState()) {
    on<IncrementEvent>((event, emit) {
      emit(AppStates(counter: state.counter + 1));
    });
    on<DecrementEvent>((event, emit) {
      emit(AppStates(counter: state.counter - 1));
    });
  }
}
