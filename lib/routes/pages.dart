import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_course_example/pages/application/application_page.dart';
import 'package:u_course_example/pages/register/bloc/register_blocs.dart';
import 'package:u_course_example/pages/register/register.dart';
import 'package:u_course_example/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:u_course_example/pages/sign_in/sign_in.dart';
import 'package:u_course_example/pages/welcome/bloc/welcome_blocs.dart';
import 'package:u_course_example/pages/welcome/views/welcome.dart';
import 'package:u_course_example/routes/names.dart';

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
        bloc: null,
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
      var result = routes().where((element) => element.route == settings.name);

      if (result.isNotEmpty) {
        return MaterialPageRoute(
          builder: (_) => result.first.page,
          settings: settings,
        );
      }
    }

    return MaterialPageRoute(
      builder: (_) => const SignIn(),
      settings: settings,
    );
  }
}

// unify blocProvider and routes and pages
class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, required this.bloc});
}
