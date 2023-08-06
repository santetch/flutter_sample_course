import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_course_example/common/entities/user.dart';
import 'package:u_course_example/pages/home/bloc/home_blocs.dart';

import '../../common/apis/course_api.dart';
import '../../global.dart';
import 'bloc/home_events.dart';

class HomeController {
  final BuildContext context;

  UserItem? userProfile = Global.storageService.getUserProfile();

  HomeController({required this.context});

  Future<void> init() async {
    if (Global.storageService.getUserToken().isNotEmpty) {
      var result = await CourseAPI.courseList();

      if (result.code == 200) {
        if (context.mounted) {
          context.read<HomeBlocs>().add(HomeCourseItem(result.data!));
        } else {
          print(result.code);
        }
      } else {
        print(result.code);
      }
    }
    return;
  }
}
