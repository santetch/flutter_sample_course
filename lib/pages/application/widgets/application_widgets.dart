import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_course_example/pages/home/home_page.dart';
import 'package:u_course_example/pages/profile/profile.dart';

import '../../../common/values/colors.dart';

Widget buildPage(int index) {
  List<Widget> widget = [
    const HomePage(),
    const Center(
      child: Text("Search"),
    ),
    const Center(
      child: Text("Course"),
    ),
    const Center(
      child: Text("Chat"),
    ),
    const Profile(),
  ];

  return widget[index];
}

final bottomTabs = [
  BottomNavigationBarItem(
    label: "Home",
    icon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset("assets/icons/home.png"),
    ),
    activeIcon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset(
        "assets/icons/home.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: "Search",
    icon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset("assets/icons/home.png"),
    ),
    activeIcon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset(
        "assets/icons/home.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: "Course",
    icon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset("assets/icons/home.png"),
    ),
    activeIcon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset(
        "assets/icons/home.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: "Chat",
    icon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset("assets/icons/home.png"),
    ),
    activeIcon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset(
        "assets/icons/home.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: "Profile",
    icon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset("assets/icons/home.png"),
    ),
    activeIcon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset(
        "assets/icons/home.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
];
