import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_course_example/pages/application/bloc/app_events.dart';
import 'package:u_course_example/pages/application/bloc/app_states.dart';

class AppBlocs extends Bloc<AppEvents, AppStates> {
  AppBlocs() : super(const AppStates()) {
    on<TriggerAppEvent>(_handleAppEvent);
  }

  void _handleAppEvent(TriggerAppEvent event, Emitter<AppStates> emit) {
    emit(state.reload(event.index));
  }
}
