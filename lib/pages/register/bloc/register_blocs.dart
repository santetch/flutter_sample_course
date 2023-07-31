import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_course_example/pages/register/bloc/register_events.dart';
import 'package:u_course_example/pages/register/bloc/register_states.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterStates> {
  RegisterBloc() : super(const RegisterStates()) {
    on<UsernameEvent>(_handleUsername);
    on<EmailEvent>(_handleEmail);
    on<PasswordEvent>(_handlePassword);
    on<RePasswordEvent>(_handleRePassword);
  }

  void _handleUsername(UsernameEvent event, Emitter<RegisterStates> emit) {
    emit(state.copyWith(username: event.username));
  }

  void _handleEmail(EmailEvent event, Emitter<RegisterStates> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _handlePassword(PasswordEvent event, Emitter<RegisterStates> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _handleRePassword(RePasswordEvent event, Emitter<RegisterStates> emit) {
    emit(state.copyWith(rePassword: event.rePassword));
  }
}
