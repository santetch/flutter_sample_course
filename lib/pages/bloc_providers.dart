import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_course_example/pages/register/bloc/register_blocs.dart';
import 'package:u_course_example/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:u_course_example/pages/welcome/bloc/welcome_blocs.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          create: (context) => SignInBloc(),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
      ];
}
