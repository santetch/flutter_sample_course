import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_course_example/common/entities/user.dart';
import 'package:u_course_example/common/values/enviroment.dart';
import 'package:u_course_example/pages/home/bloc/home_blocs.dart';

import '../../common/apis/course_api.dart';
import '../../common/entities/course.dart';
import '../../global.dart';
import 'bloc/home_events.dart';

class HomeController {
  late BuildContext context;

  UserItem? get userProfile => Global.storageService.getUserProfile();

  static final HomeController _singleton = HomeController._internal();

  HomeController._internal();

  factory HomeController({required BuildContext context}) {
    _singleton.context = context;
    return _singleton;
  }

  Future<void> init() async {
    if (Enviroment.IS_DEV) {
      context.read<HomeBlocs>().add(HomeCourseItem(devData));
      return;
    }

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

final List<CourseItem> devData = [
  CourseItem(
    name: "test",
    description: "test",
    thumbnail: "assets/icons/home.png",
    id: 123,
  )
];
