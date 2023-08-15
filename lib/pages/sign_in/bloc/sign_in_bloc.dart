import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_course_example/pages/sign_in/bloc/sign_in_events.dart';
import 'package:u_course_example/pages/sign_in/bloc/sign_in_states.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<EmailEvent>(_handleEmail);

    on<PasswordEvent>(_handlePassword);
  }

  void _handleEmail(EmailEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _handlePassword(PasswordEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(password: event.password));
  }
}
