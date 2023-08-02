import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_course_example/pages/application/application_page.dart';
import 'package:u_course_example/pages/application/bloc/app_blocs.dart';
import 'package:u_course_example/pages/home/bloc/home_blocs.dart';
import 'package:u_course_example/pages/home/home_page.dart';
import 'package:u_course_example/pages/profile/settings/bloc/settings_blocs.dart';
import 'package:u_course_example/pages/profile/settings/settings.dart';
import 'package:u_course_example/pages/register/bloc/register_blocs.dart';
import 'package:u_course_example/pages/register/register.dart';
import 'package:u_course_example/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:u_course_example/pages/sign_in/sign_in.dart';
import 'package:u_course_example/pages/welcome/bloc/welcome_blocs.dart';
import 'package:u_course_example/pages/welcome/views/welcome.dart';
import 'package:u_course_example/routes/names.dart';

import '../global.dart';
import 'page_entity.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.INITIAL,
        page: const Welcome(),
        bloc: BlocProvider(
          create: (_) => WelcomeBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.SIGN_IN,
        page: const SignIn(),
        bloc: BlocProvider(
          create: (_) => SignInBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.REGISTER,
        page: const Register(),
        bloc: BlocProvider(
          create: (_) => RegisterBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const ApplicationPage(),
        bloc: BlocProvider(
          create: (_) => AppBlocs(),
        ),
      ),
      PageEntity(
        route: AppRoutes.HOME_PAGE,
        page: const HomePage(),
        bloc: BlocProvider(
          create: (_) => HomeBlocs(),
        ),
      ),
      PageEntity(
        route: AppRoutes.SETTINGS,
        page: const Settings(),
        bloc: BlocProvider(
          create: (_) => SettingsBlocs(),
        ),
      ),
    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context) {
    return routes()
        .where((element) => element.bloc != null)
        .map((e) => e.bloc)
        .toList();
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      final result =
          routes().where((element) => element.route == settings.name);

      if (result.isNotEmpty) {
        if (result.first.route == AppRoutes.INITIAL &&
            Global.storageService.isOnBoardingCompleted()) {
          if (Global.storageService.isLoggedIn()) {
            return _goToApplicationPage(settings);
          }
          return _goToSignIn(settings);
        }

        return MaterialPageRoute(
          builder: (_) => result.first.page,
          settings: settings,
        );
      }
    }

    return _goToSignIn(settings);
  }

  static MaterialPageRoute _goToSignIn(settings) {
    return MaterialPageRoute(
      builder: (_) => const SignIn(),
      settings: settings,
    );
  }

  static MaterialPageRoute _goToApplicationPage(settings) {
    return MaterialPageRoute(
      builder: (_) => const ApplicationPage(),
      settings: settings,
    );
  }
}
