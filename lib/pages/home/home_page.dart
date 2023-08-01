import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_course_example/common/values/colors.dart';
import 'package:u_course_example/pages/home/bloc/home_blocs.dart';
import 'package:u_course_example/pages/home/bloc/home_states.dart';
import 'package:u_course_example/pages/home/widgets/home_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(),
        body: BlocBuilder<HomeBlocs, HomeStates>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  homePageText(
                    text: "Hello",
                    color: AppColors.primaryThreeElementText,
                    top: 20,
                  ),
                  homePageText(
                    text: "username",
                    color: AppColors.primaryText,
                    top: 5,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  searchView(),
                  slidersView(context, state),
                  menuView(),
                ],
              ),
            );
          },
        ));
  }
}
