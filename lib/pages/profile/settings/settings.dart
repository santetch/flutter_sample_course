import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_course_example/common/values/constant.dart';
import 'package:u_course_example/global.dart';
import 'package:u_course_example/pages/application/bloc/app_blocs.dart';
import 'package:u_course_example/pages/application/bloc/app_events.dart';
import 'package:u_course_example/pages/home/bloc/home_blocs.dart';
import 'package:u_course_example/pages/home/bloc/home_events.dart';
import 'package:u_course_example/pages/profile/settings/widgets/setings_widgets.dart';
import 'package:u_course_example/routes/routes.dart';

import '../../widgets/common_widgets.dart';
import 'bloc/settings_blocs.dart';
import 'bloc/settings_states.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar("Settings", weight: FontWeight.bold),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBlocs, SettingsStates>(
            builder: (context, state) {
          return Container(
            child: Column(
              children: [
                buildSettingsButton(context, _logOut),
              ],
            ),
          );
        }),
      ),
    );
  }

  void _logOut() {
    context.read<AppBlocs>().add(const TriggerAppEvent(0));
    context.read<HomeBlocs>().add(const HomeDots(0));
    Global.storageService.removeValue(
      AppConstants.STORAGE_USER_TOKEN_KEY,
    );
    Global.storageService.removeValue(
      AppConstants.STORAGE_USER_PROFILE_KEY,
    );
    Navigator.of(context).pushNamedAndRemoveUntil(
      AppRoutes.SIGN_IN,
      (route) => false,
    );
  }
}
