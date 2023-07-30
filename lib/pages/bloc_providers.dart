import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_course_example/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:u_course_example/pages/welcome/bloc/welcome_blocs.dart';

import '../app_blocs.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          create: (context) => AppBlocs(),
        ),
        BlocProvider(
          create: (context) => SignInBloc(),
        ),
      ];
}
